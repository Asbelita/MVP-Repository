class LoginApiRepository: LoginRepository {
    
    let loginDatasource: LoginDataSource
    
    init(loginDatasource: LoginDataSource) {
        self.loginDatasource = loginDatasource
    }
    
    func getLocalAuthIn(
        storageRepository: LocalStorageRepository,
        success: @escaping (UserAuthModel) -> Void) {
        loginDatasource.authorizedUserEntityIn(
            storageRepository: storageRepository,
            cryptoService: DataCrypterService.sharedInstance,
            success: { model in
                success(model)
            }
        )
    }
}
