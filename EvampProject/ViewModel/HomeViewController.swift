//
//  HomeViewController.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userInfo: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var responseData: LoginResponseModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        setDatatoLabels()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    @IBAction func ExploreBtn(_ sender: Any) {
        let listVc = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        listVc.rawBody = ListRawBody(token: (responseData?.userInfo!.token)!, email: (responseData?.userInfo!.email)!)
        self.navigationController?.pushViewController(listVc, animated: true)
    }
    
    func setDatatoLabels(){
        self.emailLabel.text = responseData?.userInfo?.email
        self.nameLabel.text = responseData?.userInfo?.name
        self.userInfo.text = responseData?.userInfo?.welcomeMessage
        fetchImage(URL(string: (responseData?.userInfo!.profileImage)!))
    }
    private func fetchImage(_ photoURL: URL?) {
        guard let imageURL = photoURL else { return  }
        DispatchQueue.global(qos: .userInitiated).async {
            do{
                let imageData: Data = try Data(contentsOf: imageURL)
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData)
                    self.profileImage.image = image
                }
            }catch{
                print("Unable to load data: \(error)")
            }
        }
    }
}

