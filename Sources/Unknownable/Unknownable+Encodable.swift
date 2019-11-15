//
//  Unknownable+Encodable.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//

import Foundation

extension Unknownable: Encodable where Value: Encodable, Value.RawValue: Encodable {
    public func encode(to encoder: Encoder) throws {
        switch self {
        case .known(let value):
            try value.encode(to: encoder)
        case .unknown(let rawValue):
            try rawValue.encode(to: encoder)
        }
    }
}
