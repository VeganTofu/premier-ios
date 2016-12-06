import Foundation
import Alamofire

protocol Networking {
    func getRequest(path: String, success: @escaping (Any?) -> (), failure: @escaping (NSError?) -> ())
    
}

struct Network :Networking{
    internal func getRequest(path: String, success: @escaping (Any?) -> (), failure: @escaping (NSError?) -> ()) {
        
        Alamofire.request(path).validate().responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                success(response.result.value )
            case .failure(let error):
                failure(error as NSError?)
            }
        }
    }
}
