//
//  PhotosOfObjectTableViewController.swift
//  Aparto
//
//  Created by Mac user on 16/09/21.
//

import UIKit

class PhotosOfObjectTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
            tableView.register(BuildingPermitTableViewCell.nib(), forCellReuseIdentifier: BuildingPermitTableViewCell.identifire)
        }
    }
    
    @IBOutlet weak var heightForTableView: NSLayoutConstraint!
    
    var titleArray: [Int] = [1]
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    let deviceHeight = UIScreen.main.bounds.height

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      setTableView()
    }
    
    func setTableView() {
        heightForTableView.constant = min(CGFloat(50*titleArray.count),300)
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        titleArray.append(2)
        tableView.reloadData()
        setTableView()
    }
    
}





// MARK: -- extension UITableViewDelegate

extension PhotosOfObjectTableViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("AllConvenienceViewController pressed")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


// MARK: -- extension UITableViewDataSource

extension PhotosOfObjectTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BuildingPermitTableViewCell.identifire, for: indexPath) as? BuildingPermitTableViewCell else {
            return UITableViewCell()
        }
        cell.index = indexPath
        cell.delegate = self
        cell.bacroundView.backgroundColor = UIColor.hovered
        return cell
    }
    
    
}


extension PhotosOfObjectTableViewController: DeleteRow {
    func deleteRow(index: IndexPath) {
        self.titleArray.remove(at: index.row)
        setTableView()
        tableView.deleteRows(at: [index], with: .fade)
    }
}
