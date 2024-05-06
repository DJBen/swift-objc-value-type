import Foundation
import CoreGraphics

public struct Foo: Equatable {
    // public let rect: CGRect

    public let str: String
    public let optDouble: Double?
    public let isValid: Bool

    public var isNotValid: Bool {
        return !isValid
    }
}