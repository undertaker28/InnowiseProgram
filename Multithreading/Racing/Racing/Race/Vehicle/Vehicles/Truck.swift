//
//  Truck.swift
//  Racing
//
//  Created by Pavel on 3.08.23.
//

import Foundation

final class Truck: Vehicle {
    private var weight: Int?
    override var description: String {
        return "Id: \(self.getVehicleID()), Type: Truck, Speed: \(self.getSpeed()), Weight: \(self.getWeight())"
    }
    
    init(weight: Int, speed: Int, punctureChance: Int) {
        super.init()
        self.setPunctureChance(punctureChance)
        self.setSpeed(speed)
        self.setWeight(weight)
    }
    
    private func setWeight(_ weight: Int) {
        self.weight = weight
    }
    
    private func getWeight() -> Int {
        return self.weight ?? 0
    }
    
    static func createTruck() -> Truck {
        print("Enter truck weight capacity:")
        let maxLoadCapacity = Int(readLine()!) ?? 0
        
        print("Enter truck speed:")
        let truckSpeed = Int(readLine()!) ?? 0
        
        print("Enter truck puncture chance:")
        let truckPunctureChance = Int(readLine()!) ?? 0
        
        return Truck(weight: maxLoadCapacity, speed: truckSpeed, punctureChance: truckPunctureChance)
    }
}
