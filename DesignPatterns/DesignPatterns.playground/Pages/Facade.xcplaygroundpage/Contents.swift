class UserManager {
    private var apiManager: APIManager
    private var cacheManager: CacheManager
    
    init(apiManager: APIManager = APIManager(), cacheManager: CacheManager = CacheManager()) {
        self.apiManager = apiManager
        self.cacheManager = cacheManager
    }
    
    func getUserData() -> String {
        if let cachedData = cacheManager.getCachedUserData() {
            print("Retrieved cached user data")
            return cachedData
        }
        
        let apiData = apiManager.getUserData()
        cacheManager.cacheUserData(apiData)
        print("Retrieved user data from API and cached it")
        
        return apiData
    }
}

class APIManager {
    func getUserData() -> String {
        return "User data from API"
    }
}

class CacheManager {
    func getCachedUserData() -> String? {
        return "Cached user data"
    }
    
    func cacheUserData(_ data: String) {
        print("User data cached: \(data)")
    }
}

class Client {
    static func getUserData(userManager: UserManager) {
        let userData = userManager.getUserData()
        print("Retrieved user data: \(userData)")
    }
}

let apiManager = APIManager()
let cacheManager = CacheManager()
let userManager = UserManager(apiManager: apiManager, cacheManager: cacheManager)
Client.getUserData(userManager: userManager)
