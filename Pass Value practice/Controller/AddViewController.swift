//
//  AddViewController.swift
//  Pass Value practice
//
//  Created by Ninn on 2020/1/15.
//  Copyright © 2020 Ninn. All rights reserved.
//

import UIKit

protocol EditCellDelegate: AnyObject {
    func editCell(text: String, index: Int)
}

class AddViewController: UIViewController {
    
    weak var delegate: EditCellDelegate?
    let width = UIScreen.main.bounds.width
    let textField = UITextField()
    let checkBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getCellContent(textField: textField)
    }
    
    func initView() {
        self.view.addSubview(textField)
        self.view.addSubview(checkBtn)
        textField.translatesAutoresizingMaskIntoConstraints = false
        checkBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            textField.widthAnchor.constraint(equalToConstant: width * 2 / 3),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            checkBtn.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 20),
            checkBtn.widthAnchor.constraint(equalToConstant: width * 2 / 3),
            checkBtn.heightAnchor.constraint(equalToConstant: 40),
            checkBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.contentHorizontalAlignment = .center
        textField.keyboardType = .default
        
        checkBtn.setTitle("Check", for: .normal)
        checkBtn.setTitleColor(.white, for: .normal)
        checkBtn.backgroundColor = .black
    }
    
    func getCellContent(textField: UITextField) {
        delegate?.editCell(text: textField.text!, index: 5)
        checkBtn.addTarget(self, action: #selector(sendTextToTableView), for: .touchUpInside)
    }
    
    @objc func sendTextToTableView() {
        
    }
}
