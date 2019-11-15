//
//  Expressional.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//

import Foundation

public protocol Expressional {
    static func ~= (lhs: Self, rhs: Self) -> Bool
}
