//
//  Unknownable+Expressional.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//

import Expressional

extension Unknownable: Expressional where Value.RawValue: Equatable {
    public static func ~= (lhs: Unknownable<Value>, rhs: Unknownable<Value>) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}
