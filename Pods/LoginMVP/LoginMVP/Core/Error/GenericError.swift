struct GenericError: Error {
    let localizedTitle: String
    let localizedDescription: String
    let code: Int
    
    init(title: String? = nil, description: String? = nil, statusCode: Int? = nil) {
        localizedTitle = title ?? GenericErrorConstants.title
        localizedDescription = description ?? GenericErrorConstants.description
        code = statusCode ?? GenericErrorConstants.code
    }
}
