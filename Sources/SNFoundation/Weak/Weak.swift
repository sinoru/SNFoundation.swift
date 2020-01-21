//
//  File.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//

import Foundation

@propertyWrapper
@dynamicMemberLookup
public class Weak<Value: AnyObject> {
    public weak var value: Value?

    public var wrappedValue: Value? {
        get {
            return value
        }
        set {
            value = newValue
        }
    }

    public init(wrappedValue value: Value?) {
        self.value = value
    }

    public convenience init(_ value: Value?) {
        self.init(wrappedValue: value)
    }

    subscript<T>(dynamicMember keyPath: ReferenceWritableKeyPath<Value, T>) -> T? {
        get {
            wrappedValue?[keyPath: keyPath]
        }
        set {
            guard let newValue = newValue else {
                fatalError("newValue should not be nil")
            }

            wrappedValue?[keyPath: keyPath] = newValue
        }
    }
}
