import Foundation

protocol LocalStorageDataSource {
    func save(key: String, value: String)
    func contains(_ key: String) -> Bool
    func remove(_ key: String)
    func object(_ key: String) -> String
}
