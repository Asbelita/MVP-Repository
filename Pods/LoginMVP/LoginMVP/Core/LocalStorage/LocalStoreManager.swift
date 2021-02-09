import Foundation
import UIKit

protocol LocalStoreManager {
    func user(storageRepository: LocalStorageRepository, cryptoService: DataCrypterService) -> String
    func password(storageRepository repo: LocalStorageRepository, cryptoService: DataCrypterService) -> String
}

extension LocalStoreManager {
    func  user(storageRepository repo: LocalStorageRepository, cryptoService: DataCrypterService) -> String {
        var user = repo.object(Constants.user)
        if user.isEmpty {
            let userPlain = "user1"
            user = cryptoService.crypter(string: userPlain)
            repo.save(key:Constants.user, value: user)
        }
        return user
    }
    
    func password(storageRepository repo: LocalStorageRepository, cryptoService: DataCrypterService) -> String {
        var password = repo.object(Constants.password)
        if password.isEmpty {
            let passwordPlain = "12345"
            password = cryptoService.crypter(string: passwordPlain)
            repo.save(key:Constants.password, value: password)
        }
        return password
    }
}
