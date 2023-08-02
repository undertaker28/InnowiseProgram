//
//  PierLoader.swift
//  MultithreadingShips
//
//  Created by Pavel on 1.08.23.
//

import Foundation

final class PierLoader {
    private var tunnel: Tunnel
    private var shipType: TypeOfShip
    private var updatePierLoaderInfoLabelCallback: ((String) -> Void)?

    init(tunnel: Tunnel, shipType: TypeOfShip, updatePierLoaderInfoLabelCallback: ((String) -> Void)?) {
        self.tunnel = tunnel
        self.shipType = shipType
        self.updatePierLoaderInfoLabelCallback = updatePierLoaderInfoLabelCallback
    }

    func run() {
        while true {
            Thread.current.name = "Loader \(shipType)"

            let ship = tunnel.get(shipType)

            if let ship = ship {
                while ship.countCheck() {
                    Thread.sleep(forTimeInterval: 1)
                    ship.add(count: Constants.unitsPerSecond)
                    let pierLoaderInfo = "\(ship.getCount()) units Loaded ship. \(Thread.current.name ?? "")"
                    print(pierLoaderInfo)
                    updatePierLoaderInfoLabelCallback?(pierLoaderInfo)
                }
            }
        }
    }
}
