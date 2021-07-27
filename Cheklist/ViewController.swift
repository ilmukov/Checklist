//
//  ViewController.swift
//  Cheklist
//
//  Created by Stepan Ilmukov on 27.07.2021.
//

import UIKit

class ChecklistItem {
    let title: String
    var isCheked: Bool = false
    
    init(title: String) {
        self.title = title
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let items: [ChecklistItem] = [
        "Купить молоко",
        "Купить кофе",
        "Купить йогурт",
        "Сделать модуль приложения",
        "Погулять",
        "Посмотреть видеоурок",
    ].compactMap({
        ChecklistItem(title: $0)
    })
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Чеклист"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    // table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.isCheked ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items [indexPath.row]
        item.isCheked = !item.isCheked
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}

