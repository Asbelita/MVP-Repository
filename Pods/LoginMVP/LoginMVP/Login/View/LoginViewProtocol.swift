import Foundation
import UIKit

protocol LoginViewProtocol: BaseView {
    func login(user: String, password: String)
    func showLoginError(_ error: GenericError)
    func successLogin()
}
