//
//  MainViewController.swift
//  MultithreadingShips
//
//  Created by Pavel on 1.08.23.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    private lazy var arrivalShipInfoLabel = UILabel().createInfoLabel(fontName: Constants.infoLabelFontName, fontSize: Constants.infoLabelFontSize)
    private lazy var takenShipInfoLabel = UILabel().createInfoLabel(fontName: Constants.infoLabelFontName, fontSize: Constants.infoLabelFontSize)
    private lazy var pierLoaderInfoLabel = UILabel().createInfoLabel(fontName: Constants.infoLabelFontName, fontSize: Constants.infoLabelFontSize)
    
    private lazy var stackViewOfInfoLabels: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [arrivalShipInfoLabel, takenShipInfoLabel, pierLoaderInfoLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Black")
        view.add(subviews: stackViewOfInfoLabels)
        makeConstraints()
        main()
    }

    private func main() {
        let tunnel = Tunnel()
        
        tunnel.updateArrivalShipInfoLabelCallback = { [weak self] arrivalShipInfo in
            DispatchQueue.main.async {
                self?.arrivalShipInfoLabel.text = arrivalShipInfo
            }
        }
        
        tunnel.updateTakenShipInfoLabelCallback = { [weak self] takenShipInfo in
            DispatchQueue.main.async {
                self?.takenShipInfoLabel.text = takenShipInfo
            }
        }

        let shipGenerator = ShipGenerator(tunnel: tunnel, shipCount: Constants.shipCount)

        let pierLoaderWithClothes = PierLoader(tunnel: tunnel, shipType: .clothes) { [weak self] infoAboutPierLoader in
            DispatchQueue.main.async {
                self?.pierLoaderInfoLabel.text = infoAboutPierLoader
            }
        }

        let pierLoaderWithBanana = PierLoader(tunnel: tunnel, shipType: .banana) { [weak self] infoAboutPierLoader in
            DispatchQueue.main.async {
                self?.pierLoaderInfoLabel.text = infoAboutPierLoader
            }
        }

        let pierLoaderWithBread = PierLoader(tunnel: tunnel, shipType: .bread) { [weak self] infoAboutPierLoader in
            DispatchQueue.main.async {
                self?.pierLoaderInfoLabel.text = infoAboutPierLoader
            }
        }

        let service = DispatchQueue.global(qos: .userInitiated)

        service.async {
            shipGenerator.run()
        }

        service.async {
            pierLoaderWithClothes.run()
        }

        service.async {
            pierLoaderWithBanana.run()
        }

        service.async {
            pierLoaderWithBread.run()
        }
    }
    
    private func makeConstraints() {
        stackViewOfInfoLabels.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().inset(Constants.stackViewOfInfoLabelsInset)
        }
    }
}
