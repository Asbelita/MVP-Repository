protocol LoginDataSource {
    func authorizedUserEntityIn(
        storageRepository: LocalStorageRepository,
        cryptoService: DataCrypterService,
        success: @escaping (UserAuthModel) -> Void)
}
