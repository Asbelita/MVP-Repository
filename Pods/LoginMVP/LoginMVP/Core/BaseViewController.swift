
import UIKit

public class BaseViewController: UIViewController, BaseView {
    
    // MARK: - Properties
    
    private(set) var presenter: Presenter?
    
    var isTopViewController: Bool {
        if navigationController != nil {
            return navigationController?.visibleViewController === self
        } else if tabBarController != nil {
            return tabBarController?.selectedViewController == self && presentedViewController == nil
        }
        return presentedViewController == nil && isViewLoaded && view.window != nil
    }
    
    // MARK: Initializers
    
    convenience init(presenter: Presenter) {
        self.init()
        self.presenter = presenter
    }
    
    // MARK: View life cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        presenter?.attach(view: self)
        edgesForExtendedLayout = UIRectEdge()
        extendedLayoutIncludesOpaqueBars = false
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    /// Displays a view controller `content` within a the provided `frame`
    /// - Parameter content: View controller to be displayed as child
    /// - Parameter frame: Frame to display the view controller in
    func display(content: UIViewController, frame: CGRect?) {
        addChild(content)
        content.view.frame = frame ?? view.bounds
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
