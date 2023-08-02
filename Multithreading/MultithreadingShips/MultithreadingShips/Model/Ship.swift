//
//  Ship.swift
//  MultithreadingShips
//
//  Created by Pavel on 1.08.23.
//

enum SizeOfShip: CaseIterable {
    case small
    case middle
    case large

    var value: Int {
        switch self {
        case .small:
            return 10
        case .middle:
            return 50
        case .large:
            return 100
        }
    }
    
    static func getRandomSizeOfShip() -> SizeOfShip {
        let allCases = self.allCases
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
}

enum TypeOfShip: CaseIterable {
    case bread
    case clothes
    case banana
    
    static func getRandomTypeOfShip() -> TypeOfShip {
        let allCases = self.allCases
        let randomIndex = Int.random(in: 0..<allCases.count)
        return allCases[randomIndex]
    }
}

final class Ship {
    private var count: Int
    private var size: SizeOfShip
    private var type: TypeOfShip

    init(size: SizeOfShip, type: TypeOfShip) {
        self.size = size
        self.type = type
        self.count = 0
    }

    func add(count: Int) {
        self.count += count
    }

    func countCheck() -> Bool {
        return count < size.value
    }

    func getCount() -> Int {
        return count
    }

    func getType() -> TypeOfShip {
        return type
    }

    func getSize() -> SizeOfShip {
        return size
    }
}
