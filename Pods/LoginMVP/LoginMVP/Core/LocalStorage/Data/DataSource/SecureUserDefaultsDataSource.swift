import Foundation.NSUserDefaults

class SecureUserDefaultsDataSource: LocalStorageDataSource {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
        self.clearAll()
    }

    func save(key: String, value: String) {
        let data = NSKeyedArchiver.archivedData(withRootObject: value)
        userDefaults.set(data, forKey: key)
    }

    func contains(_ key: String) -> Bool {
        return userDefaults.object(forKey: key) != nil
    }

    func remove(_ key: String) {
        userDefaults.removeObject(forKey: key)
    }

    func object(_ key: String) -> String {
        guard
            let data = userDefaults.data(forKey: key),
            let value = NSKeyedUnarchiver.unarchiveObject(with: data) as? String else {
            return Constants.empty
        }
        return value
    }
    
    func clearAll(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
