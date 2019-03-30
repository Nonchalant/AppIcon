import Foundation

protocol Extractor {
    associatedtype T
    associatedtype U
    static func extract(input: T, output: U) throws
}
