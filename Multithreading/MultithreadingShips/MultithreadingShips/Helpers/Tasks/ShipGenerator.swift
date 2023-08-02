//
//  ShipGenerator.swift
//  MultithreadingShips
//
//  Created by Pavel on 1.08.23.
//

import Foundation

final class ShipGenerator {
    private var tunnel: Tunnel
    private var shipCount: Int

    init(tunnel: Tunnel, shipCount: Int) {
        self.tunnel = tunnel
        self.shipCount = shipCount
    }

    func run() {
        var count = 0
        while count < shipCount {
            Thread.current.name = "- Generator ship"
            count += 1
            tunnel.add(Ship(size: SizeOfShip.getRandomSizeOfShip(), type: TypeOfShip.getRandomTypeOfShip()))
            Thread.sleep(forTimeInterval: 1)
        }
    }
}
