//
//  Extractor.swift
//  AppIcon
//
//  Created by Takeshi Ihara on 2017/05/10.
//
//

import Foundation

protocol Extractor {
    associatedtype T
    associatedtype U
    static func extract(base: T, output: U) throws
}
