class LoginApiDatasource: LoginDataSource, LocalStoreManager {
    
    func authorizedUserEntityIn(
        storageRepository: LocalStorageRepository,
        cryptoService: DataCrypterService,
        success: @escaping (UserAuthModel) -> Void) {
        
        let userCrypted = self.user(storageRepository: storageRepository, cryptoService: cryptoService)
        let passwordCrypted = self.password(storageRepository: storageRepository, cryptoService: cryptoService)
        let userAuth = UserAuthModel(user: userCrypted, password: passwordCrypted)
        success(userAuth)
    }
}
