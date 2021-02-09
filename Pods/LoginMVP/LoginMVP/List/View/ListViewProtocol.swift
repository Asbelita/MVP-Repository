import Foundation
import UIKit

protocol ListViewProtocol: BaseView {
    func display()
    func select(index: Int)
}
