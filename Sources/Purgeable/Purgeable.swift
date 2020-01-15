//
//  Purgeable.swift
//  
//
//  Created by Jaehong Kang on 2019/11/27.
//

import Foundation

/// A type that contains object can be purged and recreate
/// conditionally by memory pressure.
@propertyWrapper
@dynamicMemberLookup
public class Purgeable<WrappedValue: Any> {
    #if canImport(Darwin) // FIXME: Should be replaced with Mach API availalble check.
    /// Memory pressure levels
    public enum MemoryPressure {
        /// When system memory pressure condition changed to warning or critical.
        case warning
        /// When system memory pressure condition changed to critical.
        case critical

        fileprivate var dispatchSourceMemoryPressureEventMask: DispatchSource.MemoryPressureEvent {
            switch self {
            case .warning:
                return [.warning, .critical]
            case .critical:
                return [.warning]
            }
        }
    }

    /// Memory pressure to purge.
    open var memoryPressure: MemoryPressure {
        didSet {
            self.memoryPressureSource = self.newMemoryPressureSource()
        }
    }

    private var memoryPressureSource: DispatchSourceMemoryPressure? {
        willSet {
            guard self.memoryPressureSource !== newValue else {
                return
            }

            self.memoryPressureSource?.cancel()
        }
        didSet {
            guard self.memoryPressureSource !== oldValue else {
                return
            }

            self.memoryPressureSource?.resume()
        }
    }

    private func newMemoryPressureSource() -> DispatchSourceMemoryPressure {
        let memoryPressureSource = DispatchSource.makeMemoryPressureSource(
            eventMask: self.memoryPressure.dispatchSourceMemoryPressureEventMask,
            queue: self.queue
        )

        memoryPressureSource.setEventHandler {
            self.purge()
        }

        return memoryPressureSource
    }
    #endif

    private lazy var queue = DispatchQueue(label: String(reflecting: self), qos: .default)

    private let initializer: () -> WrappedValue

    private var value: WrappedValue?

    /// A object that can be purged.
    open var wrappedValue: WrappedValue {
        return self.queue.sync {
            if let object = self.value {
                return object
            } else {
                let object = initializer()

                self.value = object

                return object
            }
        }
    }

    /// Whether object is loaded.
    open var isValueLoaded: Bool {
        return self.value != nil
    }

    /// Make object purged.
    open func purge() {
        self.value = nil
    }

    #if canImport(Darwin) // FIXME: Should be replaced with Mach API availalble check.
    /// Creates a new instance for initializer object.
    ///
    /// - Parameter initializer: A initializer for re-create object after purged.
    /// - Parameter memoryPressure: Memory pressure level to purge.
    public init(wrappedValue initializer: @autoclosure @escaping () -> WrappedValue, memoryPressure: MemoryPressure = .warning) {
        self.initializer = initializer
        self.memoryPressure = memoryPressure

        self.memoryPressureSource = self.newMemoryPressureSource()
    }
    #else
    /// Creates a new instance for initializer object.
    ///
    /// - Parameter initializer: A initializer for re-create object after purged.
    public init(wrappedValue initializer: @autoclosure @escaping () -> WrappedValue) {
        self.initializer = initializer
    }
    #endif

    subscript<T>(dynamicMember keyPath: ReferenceWritableKeyPath<WrappedValue, T>) -> T {
        get {
            wrappedValue[keyPath: keyPath]
        }
        set {
            wrappedValue[keyPath: keyPath] = newValue
        }
    }
}
