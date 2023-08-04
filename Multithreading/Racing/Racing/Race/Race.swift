//
//  Race.swift
//  Racing
//
//  Created by Pavel on 3.08.23.
//

import Foundation

final class Race {
    private var racersCar: [Vehicle]
    private var distanceRace: Int

    init(racersCar: [Vehicle], distanceRace: Int) {
        self.racersCar = racersCar
        self.distanceRace = distanceRace
    }

    func start() async {
        print("===========================Log Race==========================")
        print(String(repeating: "-", count: 61))
        print("|   Id   |     Type     |    Current distance(km)/Broken    |")
        print(String(repeating: "-", count: 61))
        let startTime = Date().addingTimeInterval(3) // Delay 3 seconds to init all threads

        var vehicleMoves = [VehicleMoves]()

        for vehicle in racersCar {
            vehicle.setRoundTime(0.0)
            vehicle.setCurrentDistance(0)
            let localMove = VehicleMoves(vehicle: vehicle, startTime: startTime, distanceRace: distanceRace)
            vehicleMoves.append(localMove)
            localMove.start()
        }

        for vehicleMove in vehicleMoves {
            await vehicleMove.task()
        }

        print(String(repeating: "-", count: 61))
        print("=========================Race Results========================")

        let sortedVehicles = racersCar.sorted { $0.getRoundTime() < $1.getRoundTime() }
        
        for vehicle in sortedVehicles {
            print("Time: \(String(format: "%.0f", vehicle.getRoundTime().rounded())) seconds - \(vehicle.description)")
        }
    }
    
    func outputVehicleDescriptions() {
        for car in racersCar {
            print(car.description)
        }
    }
}
