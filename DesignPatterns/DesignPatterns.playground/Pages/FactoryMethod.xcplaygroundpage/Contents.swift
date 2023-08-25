enum Constants {
    static let countriesForSeaTransport = ["USA", "Canada", "Mexico", "Australia"]
    static let countriesForRailTransport = ["Russia", "Serbia", "Romania", "Moldova"]
    static let countriesForAirTransport = ["Germany", "Norway", "Finland", "Denmark"]
    static let countriesForRoadTransport = ["Belarus", "Poland", "Lithuania", "Latvia"]
    static let countriesForTesting = ["USA", "Russia", "Germany", "Belarus"]
}

protocol Transport {
    var companyName: String { get }
    var maxPayload: Int { get }
    var maxCargoSize: Int { get }
    func deliver() -> String
}

enum ShipType: String {
    case river = "River"
    case marine = "Marine"
}

enum FlightType: String {
    case intracity = "Intracity"
    case intercity = "Intercity"
    case international = "International"
}

enum AircraftType: String {
    case passenger = "Passenger"
    case cargo = "Cargo"
}

struct SeaTransport: Transport {
    var companyName: String
    var maxPayload: Int
    var maxCargoSize: Int
    var shipType: ShipType
    
    func deliver() -> String {
        return "           Delivery by sea"
    }
}

struct RailTransport: Transport {
    var companyName: String
    var maxPayload: Int
    var maxCargoSize: Int
    var trackSize: Int
    var arrangementOfTracksHasBallast: Bool
    
    func deliver() -> String {
        return "           Delivery by rail"
    }
}

struct AirTransport: Transport {
    var companyName: String
    var maxPayload: Int
    var maxCargoSize: Int
    var flightType: FlightType
    var aircraftType: AircraftType
    
    func deliver() -> String {
        return "           Delivery by air"
    }
}

struct RoadTransport: Transport {
    var companyName: String
    var maxPayload: Int
    var maxCargoSize: Int
    
    func deliver() -> String {
        return "           Delivery by road"
    }
}

protocol TransportFactory {
    func createTransport(for country: String) -> Transport
}

class LogisticTransportFactory: TransportFactory {
    func createTransport(for country: String) -> Transport {
        if Constants.countriesForSeaTransport.contains(country) {
            return SeaTransport(companyName: "Evergreen Line", maxPayload: 500, maxCargoSize: 150, shipType: .marine)
        } else if Constants.countriesForRailTransport.contains(country) {
            return RailTransport(companyName: "Tver Express", maxPayload: 1000, maxCargoSize: 200, trackSize: 1520, arrangementOfTracksHasBallast: true)
        } else if Constants.countriesForAirTransport.contains(country) {
            return AirTransport(companyName: "American Airlines Group", maxPayload: 300, maxCargoSize: 120, flightType: .intercity, aircraftType: .cargo)
        } else {
            return RoadTransport(companyName: "TELS CARGO", maxPayload: 800, maxCargoSize: 180)
        }
    }
}

class AutomatedCycle {
    private let transportFactory = LogisticTransportFactory()
    
    func automatedCycle() {
        for country in Constants.countriesForTesting {
            let transport = transportFactory.createTransport(for: country)
            print("--------------------------------------")
            print(transport.deliver())
            print("--------------------------------------")
            print("Company name:", transport.companyName)
            print("Maximum payload:", transport.maxPayload, "tons")
            print("Maximum cargo size:", transport.maxCargoSize, "meters")
            
            switch transport {
            case let seaTransport as SeaTransport:
                print("Ship type:", seaTransport.shipType.rawValue)
            case let railTransport as RailTransport:
                print("Track size:", railTransport.trackSize, "mm")
                print("Arrangement of tracks has ballast:", railTransport.arrangementOfTracksHasBallast ? "Yes" : "No")
            case let airTransport as AirTransport:
                print("Flight type:", airTransport.flightType.rawValue)
                print("Aircraft type:", airTransport.aircraftType.rawValue)
            default:
                break
            }
        }
    }
}

let test = AutomatedCycle()
test.automatedCycle()
