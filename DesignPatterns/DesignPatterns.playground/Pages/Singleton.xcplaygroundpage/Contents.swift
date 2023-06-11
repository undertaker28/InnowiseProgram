import Foundation

enum Constants {
    // Solar constant in W/m²
    static let solarConstant = 1370.0
    
    // Distance from the earth to the sun in meters
    static let planetDistance = 149597870700.0
}

final class Sun {
    static let shared = Sun()

    private init() {}

    func calculateLuminosity(planetDistance: Double) -> Double {
        Constants.solarConstant * 4 * Double.pi * pow(planetDistance, 2)
    }
}

class Client {
    static func testSingleton() {
        let instance1 = Sun.shared
        let instance2 = Sun.shared
        
        let luminosity = instance1.calculateLuminosity(planetDistance: Constants.planetDistance)
        print(String(format: "Luminosity of the sun: %.2e W", luminosity))

        if instance1 === instance2 {
            print("Singleton works, both variables contain the same instance.")
        } else {
            print("Singleton failed, variables contain different instances.")
        }
    }
}

Client.testSingleton()
