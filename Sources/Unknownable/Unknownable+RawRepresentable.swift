//
//  Unknownable+RawRepresentable.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//  Copyright © 2019 Sinoru. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

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
