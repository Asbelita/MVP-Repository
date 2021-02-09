import Foundation

class StorageRepository: LocalStorageRepository {
    private let datasource: LocalStorageDataSource

    init(_ datasource: LocalStorageDataSource) {
        self.datasource = datasource
    }

    func save(key: String, value: String) {
        datasource.save(key: key, value: value)
    }

    func contains(_ key: String) -> Bool {
        return datasource.contains(key)
    }

    func remove(_ key: String) {
        datasource.remove(key)
    }

    func object(_ key: String) -> String {
        return datasource.object(key)
    }
}
