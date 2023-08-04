//
//  Vehicle.swift
//  Racing
//
//  Created by Pavel on 3.08.23.
//

import Foundation

class Vehicle {
    private var speed: Int
    private var punctureChance: Int
    private var roundTime: Double
    private var currentDistance: Double
    private static var nextID: Int = 1
    private let vehicleID: Int
    
    var description: String {
        return "\(vehicleID) TYPE: VEHICLE"
    }

    init() {
        self.vehicleID = Vehicle.nextID
        Vehicle.nextID += 1
        self.roundTime = 0.0
        self.currentDistance = 0.0
        self.speed = 0
        self.punctureChance = 0
    }

    func setCurrentDistance(_ currentDistance: Double) {
        self.currentDistance = currentDistance
    }

    func getCurrentDistance() -> Double {
        return currentDistance
    }

    func setRoundTime(_ roundTime: Double) {
        self.roundTime = roundTime
    }

    func getRoundTime() -> Double {
        return roundTime
    }

    func setSpeed(_ speed: Int) {
        self.speed = speed
    }

    func setPunctureChance(_ punctureChance: Int) {
        self.punctureChance = punctureChance
    }

    func getSpeed() -> Int {
        return speed
    }

    func getPunctureChance() -> Int {
        return punctureChance
    }

    func getVehicleID() -> Int {
        return vehicleID
    }

    func nextMove(distance: Double, time: Double) {
        if speed == 0 {
            speed = 1
        }

        let minDistance = min(Double(speed) * time, distance - currentDistance)

        self.currentDistance += minDistance
        self.roundTime += minDistance / Double(speed)

        let delayTime = Int(time * 1000)
        print("|\(String.centered(String(vehicleID), length: 8))|\(String.centered(String(describing: type(of: self)), length: 14))|\(String.centered(String(format: "%.1f", currentDistance), length: 35))|")
        
        Thread.sleep(forTimeInterval: TimeInterval(delayTime) / 1000)
    }

    func nextPitStop() {
        let randomTimeDelay = Int.random(in: 1...3)

        self.roundTime += Double(randomTimeDelay)
        
        print("|\(String.centered(String(vehicleID), length: 8))|\(String.centered(String(describing: type(of: self)), length: 14))|\(String.centered("Broken, Pit Stop \(randomTimeDelay) seconds", length: 35))|")

        Thread.sleep(forTimeInterval: TimeInterval(randomTimeDelay))
    }
}
