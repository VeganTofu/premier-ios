import Foundation
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.register(Networking.self) { _ in Network() }
        defaultContainer.register(MovieApiService.self) { r in
            let apiService = MovieApiService(network: r.resolve(Networking.self)!)
            return apiService
        }
        
        defaultContainer.register(MovieViewModel.self) { r in
            let viewModel = MovieViewModel()
            viewModel.movieApiService = r.resolve(MovieApiService.self)
            return viewModel
        }
        
        defaultContainer.registerForStoryboard(MoviesViewController.self) { r,c in
            c.movieViewModel = r.resolve(MovieViewModel.self)
        }
    }
}
