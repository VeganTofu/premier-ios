import Foundation
import UIKit

struct MovieApiService{
    let movieURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=e4f9e61f6ffd66639d33d3dde7e3159b"
    
    let network:Networking
    
    func getMovies(success:@escaping ([Movie]?)->(),failure:@escaping (NSError?)->()){
        network.getRequest(path: movieURL, success: { (data) in
            guard let data = data else { return failure(NSError(domain: "", code: 0, userInfo: nil)) }
            success(self.mapMovieModels(data: data))
        }, failure: failure)
    }
    
    func mapMovieModels(data:Any) -> [Movie]{        
        if let JSON = data as? [String : AnyObject], let results = JSON["results"] as? [[String:AnyObject]] {
            return results.map({Movie(data: $0)!})
        }
        else{
            return [Movie]()
        }
    }
}
