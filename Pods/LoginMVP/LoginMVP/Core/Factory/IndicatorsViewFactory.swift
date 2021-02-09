import Foundation

class IndicatorsViewFactory {
    private let loginServiceLocator: LoginServiceLocator
    
    init(loginServiceLocator: LoginServiceLocator) {
        self.loginServiceLocator = loginServiceLocator
    }
    
    func viewController(type: IndicatorViewFactoryType) -> ListViewController {
        switch type {
        case .list:
            return ListViewController()
        case .detail:
            return ListViewController()
        }
    }
}
