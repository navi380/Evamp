//
//  ListItemsTableViewCell.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import UIKit

class ListItemsTableViewCell: UITableViewCell {
    private var images = NSCache<NSString, NSData>()
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var listItemImage: UIImageView!
    
    var representedIdentifier: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        listItemImage.layer.cornerRadius = 20
    }
    var assignData: Items?{
        didSet{
            itemTitle.text = assignData?.name
            itemDescription.text = assignData?.description
            itemPrice.text = "\(assignData?.price ?? 0)"
        }
    }
    var image: UIImage? {
        didSet {
            itemImage.image = image
        }
    }
    
}
