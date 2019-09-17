//
//  HomeViewController.swift
//  CompositionalLayout
//
//  Created by 罗超 on 2019/9/17.
//  Copyright © 2019 罗超. All rights reserved.
//

import UIKit

let cellID = "UITableViewCell"

class HomeViewController: UIViewController {

    let labels = ["vc", "vs", "vb"]
    
    lazy var homeTableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.estimatedRowHeight = 0
        tableView.rowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CompositionalLayout"
        self.view.addSubview(homeTableView)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDataSource & UItableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)!
        cell.textLabel?.text = labels[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc = UIViewController()
        
        switch indexPath.row {
        case 0:
            vc = FlowViewController()
        case 1:
            vc = ThreeFlowViewController()
        default:
            vc = CompositionalViewController()
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
