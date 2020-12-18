//
//  ViewController.swift
//  Lesson5HomeWork1
//
//  Created by Mac on 18.12.2020.
//

import UIKit

class TableViewController: UIViewController {
    private var itemsIndex: [String] = []
    @IBOutlet weak var index: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTableView()
    }
    
    private func setUpTableView(){
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 40 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.setUp(index: indexPath.row, delegate: self)
        itemsIndex.append(cell.label.text!)
        return cell
    }
    
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        title = itemsIndex[indexPath.row]
    }
}

extension TableViewController: TableViewCellDelegate {
    func buttonTapped(cell: TableViewCell) {
        guard self.tableView.indexPath(for: cell) != nil else { return }
        let storyboar = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboar.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        navigationController?.pushViewController(vc, animated: true)
        }
}
