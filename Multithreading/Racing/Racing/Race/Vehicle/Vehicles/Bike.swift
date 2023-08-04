//
//  Bike.swift
//  Racing
//
//  Created by Pavel on 3.08.23.
//

import Foundation

final class Bike: Vehicle {
    private var sidecar: Bool?
    override var description: String {
        return "Id: \(self.getVehicleID()), Type: Bike, Speed: \(getSpeed()), Sidecar: \(self.getSidecar())"
    }
    
    init(hasSidecar: Bool?, speed: Int, punctureChance: Int) {
        super.init()
        self.setPunctureChance(punctureChance)
        self.setSpeed(speed)
        self.setSidecar((hasSidecar != nil))
    }

    private func setSidecar(_ sidecar: Bool) {
        self.sidecar = sidecar
    }

    private func getSidecar() -> String {
        if sidecar ?? false {
            return "Yes"
        }
        return "No"
    }
    
    static func createBike() -> Bike {
        var hasSidecar: Bool = false

        while true {
            print("Does the bike have a sidecar? [Y/N]:")
            if let hasSidecarInput = readLine()?.uppercased(), ["Y", "N"].contains(hasSidecarInput) {
                hasSidecar = hasSidecarInput == "Y"
                break
            } else {
                print("Invalid input. Please enter 'Y' or 'N'.")
            }
        }
        
        print("Enter bike speed:")
        let bikeSpeed = Int(readLine()!) ?? 0
        
        print("Enter bike puncture chance:")
        let bikePunctureChance = Int(readLine()!) ?? 0
        
        return Bike(hasSidecar: hasSidecar, speed: bikeSpeed, punctureChance: bikePunctureChance)
    }
}
