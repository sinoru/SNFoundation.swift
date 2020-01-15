//
//  Lazy.swift
//  
//
//  Created by Jaehong Kang on 2020/01/15.
//

import Foundation

@propertyWrapper
@dynamicMemberLookup
public class Lazy<WrappedValue: Any> {
    private var initializer: (() -> WrappedValue)!
    private lazy var value: WrappedValue = {
        let initializer = self.initializer!
        self.initializer = nil

        return initializer()
    }()

    open private(set) var isLoaded: Bool = false

    public var valueIfLoaded: WrappedValue? {
        guard isLoaded else {
            return nil
        }

        return wrappedValue
    }

    public var wrappedValue: WrappedValue {
        get {
            isLoaded = true
            return value
        }
        set {
            isLoaded = true
            value = newValue
        }
    }

    public init(wrappedValue value: @autoclosure @escaping () -> WrappedValue) {
        self.initializer = value
    }

    subscript<T>(dynamicMember keyPath: ReferenceWritableKeyPath<WrappedValue, T>) -> T {
        get {
            wrappedValue[keyPath: keyPath]
        }
        set {
            wrappedValue[keyPath: keyPath] = newValue
        }
    }
}
