import UIKit

class Fonts {

    static func getDefaultFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir Next", size: size)!
    }

    static func getDefaultBoldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir Next Bold", size: size)!
    }

    static func getDefaultDemiBoldFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir Next Demi Bold", size: size)!
    }
}
