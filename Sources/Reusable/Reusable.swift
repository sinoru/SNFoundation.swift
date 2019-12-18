//
//  AnyReusable.swift
//  
//
//  Created by Jaehong Kang on 2019/11/27.
//

import Foundation

open class Reusable<T: Any> {
    public enum MemoryPressure {
        case warning
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

    public let memoryPressure: MemoryPressure

    private lazy var queue = DispatchQueue(label: String(reflecting: self), qos: .default)
    private lazy var memoryPressureSource = DispatchSource.makeMemoryPressureSource(
        eventMask: .warning,
        queue: self.queue
    )

    private let initializer: () -> T

    private var _object: T?
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

    public init(_ initializer: @autoclosure @escaping () -> T, memoryPressure: MemoryPressure = .warning) {
        self.initializer = initializer
        self.memoryPressure = memoryPressure

        self.memoryPressureSource.setEventHandler {
            self._object = nil
        }
        self.memoryPressureSource.resume()
    }
}
