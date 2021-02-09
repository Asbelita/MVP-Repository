protocol LoginRepository {
    func getLocalAuthIn(storageRepository: LocalStorageRepository,
                        success: @escaping (UserAuthModel) -> Void)
}
