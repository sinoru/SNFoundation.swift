//
//  UUID.swift
//  
//
//  Created by Jaehong Kang on 2020/01/17.
//

import Foundation

extension UUID {
    public static var empty: Self {
        return .init(uuid: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))
    }

    var isEmpty: Bool {
        return self == UUID.empty
    }
}
