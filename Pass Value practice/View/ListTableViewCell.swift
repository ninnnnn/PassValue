//
//  ListTableViewCell.swift
//  Pass Value practice
//
//  Created by Ninn on 2020/1/15.
//  Copyright © 2020 Ninn. All rights reserved.
//

import UIKit

protocol DeleteCellDelegate: AnyObject {
    func removeCell(_ cell: ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {
    
    weak var delegate: DeleteCellDelegate?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBAction func deleteBtn(_ sender: Any) {
        /* 檢查closure時請打開
        touchHandler?(self)
         */
        self.delegate?.removeCell(self)
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
    }
}
