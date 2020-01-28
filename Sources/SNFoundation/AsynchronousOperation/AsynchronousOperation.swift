//
//  AsynchronousOperation.swift
//  
//
//  Created by Jaehong Kang on 2020/01/16.
//

import Foundation

open class AsynchronousOperation<Success, Failure: Error>: Foundation.Operation {
    open override var isAsynchronous: Bool {
        return true
    }

    open var state: State? {
        didSet {
            switch state {
            case .cancelled:
                _isCancelled = true
                _isFinished = _isExecuting
                _isExecuting = false
            case .executing:
                _isExecuting = true
            case .ready:
                _isReady = true
            case .finished:
                _isExecuting = false
                _isFinished = true
            case nil:
                _isReady = false
            }
        }
    }

    private var _isCancelled: Bool = false {
        willSet {
            willChangeValue(for: \.isCancelled)
        }
        didSet {
            didChangeValue(for: \.isCancelled)
        }
    }
    open override var isCancelled: Bool {
        return _isCancelled
    }

    private var _isExecuting: Bool = false {
        willSet {
            willChangeValue(for: \.isExecuting)
        }
        didSet {
            didChangeValue(for: \.isExecuting)
        }
    }
    open override var isExecuting: Bool {
        return _isExecuting
    }

    private var _isReady: Bool = false {
        willSet {
            willChangeValue(for: \.isReady)
        }
        didSet {
            didChangeValue(for: \.isReady)
        }
    }
    open override var isReady: Bool {
        return _isReady
    }

    private var _isFinished: Bool = false {
        willSet {
            willChangeValue(for: \.isFinished)
        }
        didSet {
            didChangeValue(for: \.isFinished)
        }
    }
    open override var isFinished: Bool {
        return _isFinished
    }
}

extension AsynchronousOperation {
    public enum State {
        case ready
        case executing
        case finished(Result<Success, Failure>)
        case cancelled
    }
}
