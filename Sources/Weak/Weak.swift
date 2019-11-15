//
//  File.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//

import Foundation

public struct Weak<Wrapped: AnyObject> {
    public weak var object: Wrapped?

    public init(_ object: Wrapped?) {
        self.object = object
    }
}
