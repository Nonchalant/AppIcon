import Foundation
@testable import AppIconCore

extension AppIconSet: Equatable {
    public static func ==(lhs: AppIconSet, rhs: AppIconSet) -> Bool {
        return lhs.baseSize == rhs.baseSize
            && lhs.platform == rhs.platform
            && lhs.scales == rhs.scales
    }
}
