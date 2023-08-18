//
//  FourthMosaicCollectionViewController.swift
//  WorkWithLists
//
//  Created by Pavel on 2.07.23.
//

import UIKit
import SnapKit

final class FourthMosaicCollectionViewController: UIViewController, UICollectionViewDelegate {
    private lazy var animeData = AnimeDataGenerator().generateAnimeData(count: Constants.numberOfElementsInFourthScreen / Constants.numberOfElementsForAnimeInfo)
    
    private lazy var mosaicCollectionView: UICollectionView = {
        let mosaicLayout = MosaicLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: mosaicLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CoverImageCell.self, forCellWithReuseIdentifier: CoverImageCell.identifer)
        collectionView.register(SeasonCell.self, forCellWithReuseIdentifier: SeasonCell.identifer)
        collectionView.register(TitleCell.self, forCellWithReuseIdentifier: TitleCell.identifer)
        collectionView.register(RatingCell.self, forCellWithReuseIdentifier: RatingCell.identifer)
        collectionView.backgroundColor = UIColor(named: "Black")
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.indicatorStyle = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Black")
        view.add(subviews: mosaicCollectionView)
        makeConstraints()
    }
    
    private func makeConstraints() {
        mosaicCollectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(Constants.commonInset)
        }
    }
}

extension FourthMosaicCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.numberOfElementsInFourthScreen / Constants.numberOfElementsInPattern * Constants.numberOfCellsInPattern
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let animeIndex = indexPath.row / Constants.numberOfElementsInPattern
        let anime = animeData[animeIndex]
        
        switch indexPath.row % Constants.numberOfCellsInPattern {
        case 0, 6:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoverImageCell.identifer, for: indexPath) as? CoverImageCell else {
                preconditionFailure("Failed to load collection view cell")
            }
            
            cell.cellCoverImage.image = anime.coverImage
            return cell
            
        case 1, 4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeasonCell.identifer, for: indexPath) as? SeasonCell else {
                preconditionFailure("Failed to load collection view cell")
            }
            
            cell.seasonLabel.text = anime.season
            return cell
            
        case 2, 5:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RatingCell.identifer, for: indexPath) as? RatingCell else {
                preconditionFailure("Failed to load collection view cell")
            }
            
            cell.ratingCell.text = "\(anime.rating) / 10"
            return cell
            
        case 3, 7:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCell.identifer, for: indexPath) as? TitleCell else {
                preconditionFailure("Failed to load collection view cell")
            }
            
            cell.titleOnRussianCell.text = anime.titles["ru"]
            cell.titleOnJapanCell.text = anime.titles["jp"]?.uppercased()
            return cell
            
        default:
            fatalError("Unknown cell type")
        }
    }
}
