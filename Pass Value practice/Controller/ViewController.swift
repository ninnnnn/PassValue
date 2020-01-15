//
//  ViewController.swift
//  Pass Value practice
//
//  Created by Ninn on 2020/1/15.
//  Copyright © 2020 Ninn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var list = ["2", "3", "4", "5"]
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addBtn(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.label.text = list[indexPath.row]
        cell.touchHandler = { [weak self] cell in
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
            self?.list.remove(at: indexPath.row)
            tableView.endUpdates()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let listVC = storyboard?.instantiateViewController(identifier: "ListSB") as? AddViewController else { return }
        self.navigationController?.pushViewController(listVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
}
