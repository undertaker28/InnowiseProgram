//
//  Car.swift
//  Racing
//
//  Created by Pavel on 3.08.23.
//

import Foundation

final class Car: Vehicle {
    private var people: Int?
    override var description: String {
        return "Id: \(self.getVehicleID()), Type: Car, Speed: \(self.getSpeed()), People in car: \(self.getPeople())"
    }
    
    init(people: Int, speed: Int, punctureChance: Int) {
        super.init()
        self.setPunctureChance(punctureChance)
        self.setSpeed(speed)
        self.setPeople(people)
    }

    private func setPeople(_ people: Int) {
        self.people = people
    }
    
    private func getPeople() -> Int {
        return self.people ?? 0
    }
    
    static func createCar() -> Car {
        print("Enter the number of people in the car:")
        let carPeopleCount = Int(readLine()!) ?? 0

        print("Enter car speed:")
        let carSpeed = Int(readLine()!) ?? 0

        print("Enter car puncture chance:")
        let carPunctureChance = Int(readLine()!) ?? 0

        return Car(people: carPeopleCount, speed: carSpeed, punctureChance: carPunctureChance)
    }
}
