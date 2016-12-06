import Foundation
import SDWebImage

protocol MovieViewModelProtocol : class{
    func reloadTableView()
    func showErrorMessage(message:String)
}

class MovieViewModel {
    
    var movies:[Movie]?
    var movieApiService:MovieApiService?
    weak var delegate:MovieViewModelProtocol?
    
    func getMovies(){
        movieApiService?.getMovies(success: { (movies) in
            self.movies = movies
            self.delegate?.reloadTableView()
        }, failure: { (error) in
            self.delegate?.showErrorMessage(message: (error?.domain)!)
        })
    }
    
    func updateCell(indexPath:IndexPath, cell:MovieTableViewCell){
        guard let movie = movies?[indexPath.row] else{ return }
        
        let titleAttributedString = NSMutableAttributedString(string: movie.title)
        titleAttributedString.addAttributes(titleAttributedString.titleAttributes, range: (titleAttributedString.string as NSString).range(of: movie.title))

        cell.cellTitle.attributedText = titleAttributedString
        
        let bodyAttributedString = NSMutableAttributedString(string: movie.overview)
        bodyAttributedString.addAttributes(bodyAttributedString.bodyAttributes, range: (bodyAttributedString.string as NSString).range(of: movie.overview))
        
        cell.cellTextView.attributedText = bodyAttributedString
        
        
        if let url = NSURL(string: movie.imageURLPath()) {
            cell.cellImageView.sd_setImage(with: url as URL, placeholderImage:nil)
        }
    }
    
    func heightForCell()->Float{
        return 0.0
    }
    
}
