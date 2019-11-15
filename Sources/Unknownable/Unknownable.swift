//
//  Unknownable.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//

import Foundation

public enum Unknownable<Value: RawRepresentable> {
    case unknown(Value.RawValue)
    case known(Value)
}
