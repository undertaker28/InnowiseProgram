//
//  VehicleMoves.swift
//  Racing
//
//  Created by Pavel on 3.08.23.
//

import Foundation

// MARK: - Async/await
final class VehicleMoves {
    private var vehicle: Vehicle
    private var startTime: Date
    private var distanceRace: Int
    
    init(vehicle: Vehicle, startTime: Date, distanceRace: Int) {
        self.vehicle = vehicle
        self.startTime = startTime
        self.distanceRace = distanceRace
    }
    
    func start() {
        Task.detached {
            await self.main()
        }
    }
    
    private func main() async {
        await task()
    }

    func task() async {
        while startTime.compare(Date()) == .orderedDescending {
            // All racing car will start a race at the same time
        }
        let punctureChance = vehicle.getPunctureChance()
        while distanceRace > Int(vehicle.getCurrentDistance()) {
            if punctureChance <= Int.random(in: 0...99) {
                vehicle.nextMove(distance: Double(distanceRace), time: 0.1)
            } else {
                vehicle.nextPitStop()
            }
        }
    }
}

// MARK: - Thread
/*
final class VehicleMoves: Thread {
    private var vehicle: Vehicle
    private var startTime: Date
    private var distanceRace: Int
    private let waiter = DispatchGroup()

    init(vehicle: Vehicle, startTime: Date, distanceRace: Int) {
        self.vehicle = vehicle
        self.startTime = startTime
        self.distanceRace = distanceRace
    }
    
    override func start() {
        waiter.enter()
        super.start()
    }

    override func main() {
        task()
        waiter.leave()
    }

    private func task() {
        while startTime.compare(Date()) == .orderedDescending {
            // All racing car will start a race at the same time
        }
        let punctureChance = vehicle.getPunctureChance()
        while distanceRace > Int(vehicle.getCurrentDistance()) {
            if punctureChance <= Int.random(in: 0...99) {
                vehicle.nextMove(distance: Double(distanceRace), time: 0.1)
            } else {
                vehicle.nextPitStop()
            }
        }
    }
    
    func join() {
        waiter.wait()
    }
}
*/
