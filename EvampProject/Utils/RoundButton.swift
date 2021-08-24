//
//  RoundButton.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import Foundation
import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
//    override func {
//        super.layoutIfNeeded()
//
//    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
   
}
