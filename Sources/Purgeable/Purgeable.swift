//
//  Purgeable.swift
//  
//
//  Created by Jaehong Kang on 2019/11/27.
//

import Foundation

/// A type that contains object can be purged and recreate
/// conditionally by memory pressure.
open class Purgeable<T: Any> {
    /// Memory pressure levels
    public enum MemoryPressure {
        /// When system memory pressure condition changed to warning or critical.
        case warning
        /// When system memory pressure condition changed to critical.
        case critical

        private var dispatchSourceMemoryPressureEventMask: DispatchSource.MemoryPressureEvent {
            switch self {
            case .warning:
                return [.warning, .critical]
            case .critical:
                return [.warning]
            }
        }
    }

    /// Memory pressure to purge.
    public let memoryPressure: MemoryPressure

    private lazy var queue = DispatchQueue(label: String(reflecting: self), qos: .default)
    private lazy var memoryPressureSource = DispatchSource.makeMemoryPressureSource(
        eventMask: .warning,
        queue: self.queue
    )

    private let initializer: () -> T

    private var _object: T?
    /// A object that can be purged.
    open var object: T {
        return self.queue.sync {
            if let object = self._object {
                return object
            } else {
                let object = initializer()

                self._object = object

                return object
            }
        }
    }

    /// Creates a new instance for initializer object.
    ///
    /// - Parameter initializer: A initializer for re-create object after purged.
    /// - Parameter memoryPressure: Memory pressure level to purge.
    public init(_ initializer: @autoclosure @escaping () -> T, memoryPressure: MemoryPressure = .warning) {
        self.initializer = initializer
        self.memoryPressure = memoryPressure

        self.memoryPressureSource.setEventHandler {
            self._object = nil
        }
        self.memoryPressureSource.resume()
    }
}
