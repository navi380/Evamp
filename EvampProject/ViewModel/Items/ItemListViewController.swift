//
//  ItemListViewController.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var listItemTableView: UITableView!
    var dataViewModel = Injection.provide.ListItemsApiProtocolInjection()
    var listItemData = [ListRawBodyResponse]()
    var listofItems: [Items] = []
    let network = ImageCache.shared
    
    var rawBody: ListRawBody? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
        self.title = "items List"
        callListDataApi()
    }
    func callListDataApi(){
        dataViewModel.listOfItems(listItem: rawBody!) { listItems in
            switch listItems{
            case .success(let success):
                self.listItemData = success
                DispatchQueue.main.async {
                    self.listItemTableView.reloadData()
                }
                for item in self.listItemData{
                    self.listofItems = item.items!
                }
            case .failure(let err):
                print(err)
            }
        }
    }
}



extension ItemListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListItemsTableViewCell
        let item = listofItems[indexPath.row]
        cell.assignData = listofItems[indexPath.row]
        cell.image = nil
        let idetifier = item.id
        cell.representedIdentifier = idetifier
        DispatchQueue.global(qos: .userInitiated).async() {
            self.network.image(url: URL(string: item.itemImage)!) { data, error in
                let img = self.image(data: data)
                DispatchQueue.main.async {
                    if (cell.representedIdentifier == idetifier) {
                        cell.image = img
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func image(data: Data?) -> UIImage? {
        if let data = data {
            return UIImage(data: data)
        }
        return UIImage(systemName: "picture")
    }
}

