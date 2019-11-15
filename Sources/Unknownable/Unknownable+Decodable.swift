//
//  Unknownable+Decodable.swift
//  
//
//  Created by Jaehong Kang on 2019/11/15.
//

import Foundation

extension Unknownable: Decodable where Value: Decodable, Value.RawValue: Decodable {
    public init(from decoder: Decoder) throws {
        do {
            self = .known(try Value(from: decoder))
        } catch {
            self = .unknown(try Value.RawValue(from: decoder))
        }
    }
}
