//
//  Extension+UIColor.swift
//  Escolaqui
//
//  Created by Thiago Vinhote on 09/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
    }
}

extension UIColor {
    
    open class var background: UIColor {
        get {
            return UIColor(r: 25, g: 41, b: 58)
        }
    }
    
    open class var botao: UIColor {
        get {
            return UIColor(r: 0, g: 87, b: 163)
        }
    }
    
    open class var faixa: UIColor {
        get {
            return UIColor(r: 24, g: 33, b: 46)
        }
    }
    
    open class var fonte: UIColor {
        get {
            return UIColor(r: 77, g: 95, b: 108)
        }
    }
    
    open class var subtitulo: UIColor {
        get {
            return UIColor(r: 214, g: 195, b: 114)
        }
    }
    
    open class var titulo: UIColor {
        get {
            return UIColor(r: 89, g: 194, b: 177)
        }
    }
    
}

public func shadow(to layer: CALayer, color: UIColor) {
    
    layer.shadowOpacity = 3.0
    layer.shadowOffset = CGSize(width: 3, height: 3)
    layer.shadowRadius = 5.0
    layer.shadowColor = color.cgColor
}
