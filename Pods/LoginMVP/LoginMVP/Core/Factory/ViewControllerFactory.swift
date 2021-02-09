import Foundation
import UIKit

/// A factory to create view controllers based on an associated type
public class ViewControllerFactory {
    private static var loginServiceLocator = LoginServiceLocator()
    private static var storageServiceLocator = StorageServiceLocator()
    
    public init(){}
    
    public class func viewController(type: LoginViewFactoryType) -> BaseViewController {
        let loginFactory = LoginViewFactory(
            loginServiceLocator: loginServiceLocator,
            storageServiceLocator: storageServiceLocator
        )
        return loginFactory.viewController()
    }
    
    class func viewController(type: IndicatorViewFactoryType) -> BaseViewController {
        let indicatorFactory = IndicatorsViewFactory(
            loginServiceLocator: loginServiceLocator//change this akpj
        )
        return indicatorFactory.viewController(type: type)
    }
}
