@testable import MVP_Repository
import XCTest

class LoginUseCaseTests: XCTestCase {
    var sut: LoginUseCase!
    var repository: LoginRepositoryMock!
        
    override func setUp() {
        repository = LoginRepositoryMock()
        sut = LoginUseCase(loginRepository: repository, storageRepository:StorageServiceLocator().defaultRepository)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFailAuth(){
        let user = "user"
        let password = "12345"
        repository.getLocalAuthInSuccess = true
        sut.login(user: user, password: password) { (model, error) in
            XCTAssertNil(model)
            XCTAssertNotNil(error)
        }
    }
}
