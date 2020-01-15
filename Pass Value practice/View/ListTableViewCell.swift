//
//  ListTableViewCell.swift
//  Pass Value practice
//
//  Created by Ninn on 2020/1/15.
//  Copyright © 2020 Ninn. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBAction func deleteBtn(_ sender: Any) {
        touchHandler?(s elf)
    }
    
    var touchHandler: ((UITableViewCell) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        deleteBtn.layer.borderWidth = 1
        deleteBtn.layer.borderColor = UIColor.red.cgColor
        deleteBtn.layer.cornerRadius = 5
        deleteBtn.titleEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
