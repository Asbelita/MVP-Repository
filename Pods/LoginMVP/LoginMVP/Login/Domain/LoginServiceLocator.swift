class LoginServiceLocator {
    let storageLocator = StorageServiceLocator()
    
    private var loginDatasource: LoginDataSource {
        return LoginApiDatasource()
    }
    
    var loginRepository: LoginRepository {
        return LoginApiRepository(loginDatasource: loginDatasource)
    }
    
    var loginUseCase: LoginUseCase {
        return LoginUseCase(
            loginRepository: loginRepository, storageRepository: storageLocator.defaultRepository
        )
    }
}
