struct LoginUseCase {
    
    private var loginRepository: LoginRepository
    private let storageRepository: LocalStorageRepository
    
    init(loginRepository: LoginRepository,
         storageRepository: LocalStorageRepository) {
        self.loginRepository = loginRepository
        self.storageRepository = storageRepository
    }
    
    func login(user: String,
               password: String,
               completionHandler: @escaping (ResponseModel?, GenericError?) -> Void) {
        
        loginRepository.getLocalAuthIn(storageRepository: storageRepository) { model in
            let userCrypted = DataCrypterService.sharedInstance.crypter(string: user)
            let passsCrypted = DataCrypterService.sharedInstance.crypter(string: password)
            if model.user == userCrypted && model.password == passsCrypted {
                let response = ResponseModel(success: true, message: Constants.success, code: Constants.code200)
                completionHandler(response, nil)
            }
            else {
                let failureError = GenericError(description: Constants.errorLogin)
                completionHandler(nil, failureError)
            }
        }
    }
}
