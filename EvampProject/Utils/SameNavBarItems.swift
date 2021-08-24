//
//  SameNavBarItems.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import Foundation
import UIKit

extension UIViewController{
     func setupNavigationBarItems(){
        //Removing Bottom Line
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        self.title = "PROFILE"
       
        let searchBtn = UIButton(type: .custom)
        let searchImage = UIImage(systemName: "magnifyingglass")?.withTintColor(UIColor(hexString: "#3296ed"), renderingMode: .alwaysOriginal)
        searchBtn.setImage(searchImage, for: .normal)
        let rightBarButton = UIBarButtonItem(customView: searchBtn)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        let sidebarBtn = UIButton(type: .custom)
        let sidebarBtnImage = UIImage(systemName: "sidebar.right")?.withTintColor(UIColor(hexString: "#3296ed"), renderingMode: .alwaysOriginal)
        sidebarBtn.setImage(sidebarBtnImage, for: .normal)
        let leftBarButton = UIBarButtonItem(customView: sidebarBtn)
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
}
