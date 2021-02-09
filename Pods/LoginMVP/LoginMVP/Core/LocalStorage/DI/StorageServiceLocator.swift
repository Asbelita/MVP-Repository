import Foundation

class StorageServiceLocator {
    private var userDefaults: UserDefaults {
        return UserDefaults.standard
    }

    private var defaultDatasource: LocalStorageDataSource {
        return SecureUserDefaultsDataSource(userDefaults: userDefaults)
    }

    var defaultRepository: LocalStorageRepository {
        return StorageRepository(defaultDatasource)
    }
}
