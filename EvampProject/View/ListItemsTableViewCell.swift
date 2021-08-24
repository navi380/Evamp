//
//  ListItemsTableViewCell.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import UIKit

class ListItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var listItemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        listItemImage.layer.cornerRadius = 20
    }

}
