import SwiftUI

@resultBuilder
public struct UIViewBuilder {
    public static func buildBlock(_ components: UIView...) -> [UIView] { components }
    public static func buildEither(first component: UIView) -> [UIView] { [component] }
    public static func buildEither(second component: UIView) -> [UIView] { [component] }
    public static func buildArray(_ components: [UIView]) -> [UIView] { components }
    public static func buildLimitedAvailability(_ component: UIView) -> [UIView] { [component] }
    public static func buildOptional(_ component: UIView?) -> [UIView] { [component].compactMap { $0 } }
}
