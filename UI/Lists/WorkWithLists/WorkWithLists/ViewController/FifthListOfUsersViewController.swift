//
//  FifthListOfUsersViewController.swift
//  WorkWithLists
//
//  Created by Pavel on 2.07.23.
//

import UIKit
import SnapKit

final class FifthListOfUsersViewController: UIViewController {
    private lazy var fakeUsers: [User] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(FirstAndFifthListOfUsersTableCell.self, forCellReuseIdentifier: FirstAndFifthListOfUsersTableCell.identifer)
        tableView.rowHeight = 72
        tableView.backgroundColor = UIColor(named: "Black")
        tableView.separatorColor = .lightGray
        tableView.refreshControl = refreshControl
        tableView.tableHeaderView = UIView()
        return tableView
    }()
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.center = view.center
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()
    
    private lazy var emptyView: UIView = {
        let view = EmptyView()
        view.isHidden = true
        return view
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Black")
        setupNavigationBar()
        view.add(subviews: tableView, activityIndicatorView, emptyView)
        makeConstraints()
        
        loadData(withDelay: 6.0)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = UIColor.white
        let cleanListOfUsersBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "clear.fill"), style: .plain, target: self, action: #selector(clearListOfUsersButtonTapped))
        navigationItem.rightBarButtonItem = cleanListOfUsersBarButtonItem
    }
    
    @objc private func refreshData() {
        loadData(withDelay: 3.0)
    }
    
    private func loadData(withDelay delay: TimeInterval = 0.0) {
        if self.fakeUsers.isEmpty {
            activityIndicatorView.startAnimating()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.fakeUsers = UserDataGenerator().generateUsers(count: Constants.numberOfFakeUsersToGenerate)
            
            self.tableView.reloadData()
            
            self.activityIndicatorView.stopAnimating()
            
            self.refreshControl.endRefreshing()
            
            self.emptyView.isHidden = !self.fakeUsers.isEmpty
        }
    }
    
    @objc private func clearListOfUsersButtonTapped() {
        fakeUsers.removeAll()
        tableView.reloadData()
        emptyView.isHidden = !fakeUsers.isEmpty
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        emptyView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(Constants.emptyViewSize)
        }
    }
}

extension FifthListOfUsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstAndFifthListOfUsersTableCell.identifer, for: indexPath) as? FirstAndFifthListOfUsersTableCell else {
            preconditionFailure("Failed to load table view cell")
        }
        
        if indexPath == tableView.lastCellIndexPath {
            cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.bounds.width + 1, bottom: 0, right: 0)
        } else {
            cell.separatorInset = .zero
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
