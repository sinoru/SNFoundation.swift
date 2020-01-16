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
        willSet {
            switch state {
            case .cancelled:
                willChangeValue(for: \.isCancelled)
            case .executing:
                willChangeValue(for: \.isExecuting)
            case .ready:
                willChangeValue(for: \.isReady)
            case .finished:
                willChangeValue(for: \.isFinished)
            case nil:
                break
            }

            switch newValue {
            case .cancelled:
                willChangeValue(for: \.isCancelled)
            case .executing:
                willChangeValue(for: \.isExecuting)
            case .ready:
                willChangeValue(for: \.isReady)
            case .finished:
                willChangeValue(for: \.isFinished)
            case nil:
                break
            }
        }
        didSet {
            switch oldValue {
            case .cancelled:
                didChangeValue(for: \.isCancelled)
            case .executing:
                didChangeValue(for: \.isExecuting)
            case .ready:
                didChangeValue(for: \.isReady)
            case .finished:
                didChangeValue(for: \.isFinished)
            case nil:
                break
            }

            switch state {
            case .cancelled:
                didChangeValue(for: \.isCancelled)
            case .executing:
                didChangeValue(for: \.isExecuting)
            case .ready:
                didChangeValue(for: \.isReady)
            case .finished:
                didChangeValue(for: \.isFinished)
            case nil:
                break
            }
        }
    }

    open override var isCancelled: Bool {
        if case .cancelled = state {
            return true
        } else {
            return false
        }
    }

    open override var isExecuting: Bool {
        if case .executing = state {
            return true
        } else {
            return false
        }
    }

    open override var isReady: Bool {
        if case .ready = state {
            return true
        } else {
            return false
        }
    }

    open override var isFinished: Bool {
        if case .finished = state {
            return true
        } else {
            return false
        }
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
