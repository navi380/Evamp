//
//  CardImage.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import Foundation
import UIKit

extension UIImageView {
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.red.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = CGSize.zero
        //width and height can be negative for left side and postive for right side offset & same for other
        containerView.layer.shadowOffset.height = 10
        containerView.layer.shadowOffset.width = -10
        //shadow radius is for radius under the view
        containerView.layer.shadowRadius = 10
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}
