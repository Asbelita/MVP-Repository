@testable import MVP_Repository
import XCTest

class LoginRepositoryMock : LoginRepository {
    
    var getLocalAuthInSuccess = false
    
    func getLocalAuthIn(storageRepository: LocalStorageRepository, success: @escaping (UserAuthModel) -> Void) {
        if getLocalAuthInSuccess {
            success(userAuthModelMock())
        }
    }
    
    private func userAuthModelMock()-> UserAuthModel{
        return UserAuthModel(user: "user", password: "11111")
    }
}

