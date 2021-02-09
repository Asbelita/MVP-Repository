import Foundation

class LoginViewFactory {
    private let loginServiceLocator: LoginServiceLocator
    private let storageServiceLocator: StorageServiceLocator
    
    init(
        loginServiceLocator: LoginServiceLocator,
        storageServiceLocator: StorageServiceLocator
    ) {
        self.loginServiceLocator = loginServiceLocator
        self.storageServiceLocator = storageServiceLocator
    }
    
    func viewController() -> LoginViewController {
        let presenter = LoginPresenter(loginUseCase: loginServiceLocator.loginUseCase, localStorage: storageServiceLocator.defaultRepository)
        return LoginViewController(
            presenter: presenter
        )
    }
}
