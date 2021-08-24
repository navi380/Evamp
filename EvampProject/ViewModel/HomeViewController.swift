//
//  HomeViewController.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    @IBAction func ExploreBtn(_ sender: Any) {
        let listVc = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        self.navigationController?.pushViewController(listVc, animated: true)
    }
}

