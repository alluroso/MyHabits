//
//  Extensions.swift
//  MyHabits
//
//  Created by Алексей Калинин on 27.02.2023.
//

import UIKit

public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        for i in subviews {
            self.addSubview(i)
        }
    }
}

extension UIColor {
    static let blueCustom = UIColor(named: "Blue")
    static let greenCustom = UIColor(named: "Green")
    static let indigoCustom = UIColor(named: "Indigo")
    static let lightGrayCustom = UIColor(named: "LightGray")
    static let orangeCustom = UIColor(named: "Orange")
    static let purpleCustom = UIColor(named: "Purple")
}

extension UIFont {
    static let title3 = UIFont.systemFont(ofSize: 20, weight: .semibold)
    static let headLine = UIFont.systemFont(ofSize: 17, weight: .semibold)
    static let body = UIFont.systemFont(ofSize: 17, weight: .regular)
    static let footnoteBold = UIFont.systemFont(ofSize: 13, weight: .semibold)
    static let footnoteStatus = UIFont.systemFont(ofSize: 13, weight: .semibold)
    static let footnote = UIFont.systemFont(ofSize: 13, weight: .regular)
    static let caption = UIFont.systemFont(ofSize: 12, weight: .regular)
}
