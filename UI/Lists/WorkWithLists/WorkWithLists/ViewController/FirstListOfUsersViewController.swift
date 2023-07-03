//
//  FirstListOfUsersViewController.swift
//  WorkWithLists
//
//  Created by Pavel on 2.07.23.
//

import UIKit
import SnapKit

final class FirstListOfUsersViewController: UIViewController {
    private lazy var fakeUsers = UserGenerator().generateUsers(count: Constants.numberOfFakeUsersToGenerate)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(FirstListOfUsersTableCell.self, forCellReuseIdentifier: String(describing: FirstListOfUsersTableCell.self))
        tableView.rowHeight = 72
        tableView.backgroundColor = UIColor(named: "Black")
        tableView.separatorColor = .lightGray
        tableView.tableHeaderView = UIView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Black")
        view.add(subviews: tableView)
        makeConstraints()
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension FirstListOfUsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstListOfUsersTableCell.self), for: indexPath) as? FirstListOfUsersTableCell else {
            fatalError("Unable to dequeue \(FirstListOfUsersTableCell.self)")
        }
        
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(named: "Black")
        
        let user = fakeUsers[indexPath.row]
        
        cell.cellAvatarView.URLImage(url: user.squareAvatarUrl)
        cell.cellFirstLine.text = "\(user.firstName) \(user.lastName)"
        cell.cellSecondLine.text = "Age: \(user.age)"
        
        if user.sex == "Male" {
            cell.cellGenderIconView.image = UIImage(named: "Male")?.withRenderingMode(.alwaysTemplate)
            cell.cellGenderIconView.tintColor = UIColor(named: "Blue")
        } else {
            cell.cellGenderIconView.image = UIImage(named: "Female")?.withRenderingMode(.alwaysTemplate)
            cell.cellGenderIconView.tintColor = UIColor(named: "Pink")
        }
        
        return cell
    }
}
