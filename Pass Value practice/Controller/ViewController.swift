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
        guard let listVC = storyboard?.instantiateViewController(identifier: "ListSB") as? AddViewController else { return }
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func deleteCell(sender: AnyObject) {
        list.remove(at: sender.tag)
        tableView.reloadData()
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
        cell.deleteBtn.tag = indexPath.row
        
        switch indexPath.row {
        case 0: // closure
            /* 檢查closure時請打開
            cell.touchHandler = { [weak self] cell in
                guard let indexPath = tableView.indexPath(for: cell) else { return }
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .left)
                self?.list.remove(at: indexPath.row)
                tableView.endUpdates()
            }
             */
            break
        case 1: // addTarget
            cell.deleteBtn.addTarget(self, action: #selector(deleteCell(sender:)), for: .touchUpInside)
        default: // delegate
            cell.delegate = self
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

extension ViewController: DeleteCellDelegate {
    func removeCell(_ cell: ListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        self.list.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
}
