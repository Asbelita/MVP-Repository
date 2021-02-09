import UIKit
import Foundation

class LoginViewController: BaseViewController, LoginViewProtocol {
    
    // MARK: - Properties
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK: - Computed Properties
    
    var loginPresenter: LoginPresenter? {
        return presenter as? LoginPresenter
    }
    
    // MARK: - Private
    private func setup() {
        loginButton.addTarget(self, action: #selector(logintapped), for: .touchUpInside)
    }
    
    @objc
    private func logintapped(){
        login(user: userField.text!, password: passwordField.text!)
    }
    
    // MARK: - Overridden
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.setNeedsUpdateConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - LoginViewProtocol
    
    func login(user: String, password: String) {
        view.endEditing(true)
        loginPresenter?.login(user: user, password: password)
    }
    
    func showLoginError(_ error: GenericError) {
        let action = UIAlertAction(
            title: Constants.ok,
            style: .cancel,
            handler: .none
        )
        let alertController = UIAlertController(title: error.localizedTitle, message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func successLogin() {
        let viewController = ViewControllerFactory.viewController(type: .list)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
