//
//  Main.swift
//  Racing
//
//  Created by Pavel on 3.08.23.
//

import Foundation

@main
struct Main {
    static func main() async {
        await startRace()
    }

    static func startRace() async {
        var racersCar: [Vehicle] = []
        var distanceRace: Int = 0
        var numberOfVehicles: Int = 0
        
        var isValidInput = false
        while !isValidInput {
            print("Enter the number of vehicles (2 to 10):")
            if let numberInput = readLine(), let number = Int(numberInput) {
                if number >= 2 && number <= 10 {
                    numberOfVehicles = number
                    isValidInput = true
                } else {
                    print("Invalid input. Please enter a number of vehicles between 2 and 10.")
                }
            } else {
                print("Invalid input. Please enter a valid integer.")
            }
        }

        for _ in 1...numberOfVehicles {
            var vehicleType: Int
            repeat {
                print("""
                      Please select the vehicle type:
                      1. Car
                      2. Bike
                      3. Truck
                      """)
                if let input = readLine(), let choice = Int(input) {
                    vehicleType = choice
                    if vehicleType < 1 || vehicleType > 3 {
                        print("Invalid choice, please try again.")
                    }
                } else {
                    print("Invalid input, please try again.")
                    vehicleType = 0
                }
            } while vehicleType < 1 || vehicleType > 3

            let vehicle: Vehicle
            switch vehicleType {
            case 1:
                vehicle = Car.createCar()
            case 2:
                vehicle = Bike.createBike()
            case 3:
                vehicle = Truck.createTruck()
            default:
                fatalError("Invalid vehicle type")
            }

            racersCar.append(vehicle)
        }
        
        isValidInput = false
        while !isValidInput {
            print("Enter the race distance in kilometers (5 to 100):")
            if let distanceInput = readLine(), let distance = Int(distanceInput) {
                if distance >= 5 && distance <= 100 {
                    distanceRace = distance
                    isValidInput = true
                } else {
                    print("Invalid input. Please enter a distance between 5 and 100 kilometers.")
                }
            } else {
                print("Invalid input. Please enter a valid integer.")
            }
        }
        
        print("==========================About Race=========================")
        print("Race distance: \(distanceRace) kilometers")
        print("Number of racers: \(racersCar.count)")
        
        let race = Race(racersCar: racersCar, distanceRace: distanceRace)
        
        race.outputVehicleDescriptions()

        await race.start()
        
        isValidInput = false
        while !isValidInput {
            print("One more lap? [Y/N]:")
            if let answer = readLine()?.uppercased(), ["Y", "N"].contains(answer) {
                if answer == "Y" {
                    await race.start()
                } else {
                    isValidInput = true
                }
            } else {
                print("Invalid input. Please enter 'Y' or 'N'.")
            }
        }
    }
}
