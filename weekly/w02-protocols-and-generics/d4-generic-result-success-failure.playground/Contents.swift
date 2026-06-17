import Foundation

enum MyResult<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}




// MARK: - Map
extension MyResult {
    func map<NewSuccess>(_ transform: (Success) -> NewSuccess) -> MyResult<NewSuccess, Failure> {
        switch self {
        case .success(let value):
            let newSuccess = transform(value)
            return MyResult<NewSuccess, Failure>.success(newSuccess)
            
        case .failure(let error):
            return MyResult<NewSuccess, Failure>.failure(error)
        }
    }
}


// MARK: - FlatMap
extension MyResult {
    func flatMap<NewSuccess>(_ transform: (Success) -> MyResult<NewSuccess, Failure>) -> MyResult<NewSuccess, Failure> {
        switch self {
        case .success(let value):
            return transform(value)
            
        case .failure(let error):
            return MyResult<NewSuccess, Failure>.failure(error)
        }
    }
    
}

// MARK: - MapError
extension MyResult {
    func mapError<NewFailure: Error>(_ transform: (Failure) -> NewFailure) -> MyResult<Success, NewFailure> {
        switch self {
        case .success(let success):
            return MyResult<Success, NewFailure>.success(success)
            
        case .failure(let error):
            let newError = transform(error)
            return MyResult<Success, NewFailure>.failure(newError)
        }
    }
}
