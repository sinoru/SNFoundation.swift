//
//  Unknownable+RawRepresentable.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//

import Foundation

extension Unknownable: RawRepresentable {
    public typealias RawValue = Value.RawValue

    public init?(rawValue: Value.RawValue) {
        self = Value(rawValue: rawValue).flatMap { .known($0) } ?? .unknown(rawValue)
    }

    public var rawValue: Value.RawValue {
        switch self {
        case .known(let value):
            return value.rawValue
        case .unknown(let rawValue):
            return rawValue
        }
    }
}
