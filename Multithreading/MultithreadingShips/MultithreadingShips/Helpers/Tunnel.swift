//
//  Tunnel.swift
//  MultithreadingShips
//
//  Created by Pavel on 1.08.23.
//

import Foundation

final class Tunnel {
    private var store: [Ship] = []
    private var shipsCount = 0
    private let condition = NSCondition()
    
    var updateArrivalShipInfoLabelCallback: ((String) -> Void)?
    var updateTakenShipInfoLabelCallback: ((String) -> Void)?

    func add(_ element: Ship) {
        condition.lock()
        defer { condition.unlock() }

        while shipsCount >= Constants.maxShipsInTunnel {
            let noPlaceInfo = "\(store.count) > There is no place for a ship in the tunnel: \(Thread.current.name ?? "")"
            print(noPlaceInfo)
            condition.wait()
        }

        store.append(element)
        let arrivalShipInfo = "\(store.count) + The ship arrived in the tunnel: \(element.getType()) \(element.getSize()) \(Thread.current.name ?? "")"
        print(arrivalShipInfo)
        updateArrivalShipInfoLabelCallback?(arrivalShipInfo)
        shipsCount += 1
        condition.broadcast()
    }

    func get(_ shipType: TypeOfShip) -> Ship? {
        condition.lock()
        defer { condition.unlock() }

        while shipsCount <= Constants.minShipsInTunnel {
            let noShipsInfo = "0 < There are no ships in the tunnel"
            print(noShipsInfo)
            condition.wait()
        }

        if let index = store.firstIndex(where: { $0.getType() == shipType }) {
            shipsCount -= 1
            let takenShipInfo = "\(store.count) - The ship is taken from the tunnel: \(Thread.current.name ?? "")"
            print(takenShipInfo)
            updateTakenShipInfoLabelCallback?(takenShipInfo)
            return store.remove(at: index)
        }

        return nil
    }
}
