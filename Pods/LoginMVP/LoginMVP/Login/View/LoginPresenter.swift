import Foundation
import UIKit

class LoginPresenter: Presenter, LocalStoreManager {
    // MARK: - Properties
    var view: BaseView?
    let loginUseCase: LoginUseCase
    let localStorage: LocalStorageRepository
    
    private var loginView: LoginViewProtocol? {
        return view as? LoginViewProtocol
    }
    // MARK: - Initialization
    
    init(
        loginUseCase: LoginUseCase,
        localStorage: LocalStorageRepository
    ) {
        self.loginUseCase = loginUseCase
        self.localStorage = localStorage
    }
    
    func login(user: String, password: String) {
        
        if user.isEmpty || password.isEmpty {
            
        }
        loginUseCase.login(user: user, password: password) { response, error in
            if response != nil {
                self.loginView?.successLogin()
            } else if let error = error {
                self.loginView?.showLoginError(error)
            }
        }
    }
}
