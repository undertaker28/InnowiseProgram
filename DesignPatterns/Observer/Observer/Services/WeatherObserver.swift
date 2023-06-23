//
//  WeatherObserver.swift
//  Observer
//
//  Created by Pavel on 23.06.23.
//

import Foundation

protocol WeatherSubscriber: AnyObject {
    func updateWeather(_ weather: Int)
}

final class WeatherObserver {
    static let shared = WeatherObserver()
    
    private var subscribers: [WeatherSubscriber] = []
    private var timer: Timer?
    
    private init() {}
    
    func subscribe(_ subscriber: WeatherSubscriber) {
        subscribers.append(subscriber)
        if subscribers.count == 1 {
            startTimer()
        }
    }
    
    func unsubscribe(_ subscriber: WeatherSubscriber) {
        subscribers.removeAll { $0 === subscriber }
        if subscribers.isEmpty {
            stopTimer()
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            let weather = Int(Date.timeIntervalSinceReferenceDate) % 35
            self.notifySubscribers(weather)
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func notifySubscribers(_ weather: Int) {
        subscribers.forEach { $0.updateWeather(weather) }
    }
}
