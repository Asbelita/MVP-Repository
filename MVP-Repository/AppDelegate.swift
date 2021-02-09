
import UIKit
import LoginMVP

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var loginNavigationController: UINavigationController = {
        let viewController = ViewControllerFactory.viewController(type: .login)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        prepareWindow()
        return true
    }
    
    // MARK: Preparation
    
    func prepareWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = loginNavigationController
        window?.makeKeyAndVisible()
    }

}

