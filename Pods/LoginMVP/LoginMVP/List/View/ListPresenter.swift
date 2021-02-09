import Foundation
import UIKit

class ListPresenter: Presenter{
    // MARK: - Properties
    var view: BaseView?
    let getIndicatorsUseCase: GetIndicatorsUseCase

    private var listView: ListViewProtocol? {
        return view as? ListViewProtocol
    }
    
    init(useCase: GetIndicatorsUseCase) {
        getIndicatorsUseCase = useCase
    }
    
    func fetchIndicators(){
        getIndicatorsUseCase.execute(){ list, error in
            
            // listView?.display()
        }
    }
}
