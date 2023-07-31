//
//  ThirdGridCollectionViewController.swift
//  WorkWithLists
//
//  Created by Pavel on 2.07.23.
//

import UIKit
import SnapKit

final class ThirdGridCollectionViewController: UIViewController {
    private let categories = Constants.categories
    private let icons = Constants.icons
    private let colors = Constants.colors
    
    private lazy var gridCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ThirdGridCollectionCell.self, forCellWithReuseIdentifier: ThirdGridCollectionCell.identifer)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "Black")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Black")
        view.add(subviews: gridCollectionView)
        makeConstraints()
    }
    
    private func makeConstraints() {
        gridCollectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(Constants.commonInset)
        }
    }
}

extension ThirdGridCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - layout.minimumLineSpacing / 2
        return CGSize(width: widthPerItem, height: Constants.collectionCellHeight)
    }
}

extension ThirdGridCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.numberOfElementsInThirdScreen
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdGridCollectionCell.identifer, for: indexPath) as? ThirdGridCollectionCell else {
            preconditionFailure("Failed to load collection view cell")
        }
        
        cell.categoryLabel.text = categories[indexPath.row % categories.count].uppercased()
        cell.cellIconView.image = UIImage(systemName: icons[indexPath.row % icons.count], withConfiguration: Constants.symbolConfiguration)
        cell.backgroundColor = colors[indexPath.row % colors.count]
        
        return cell
    }
}
