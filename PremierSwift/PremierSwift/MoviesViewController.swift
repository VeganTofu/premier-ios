import UIKit

protocol MoviesViewControllerProtocol {
    func cellSelected(indexPath:NSIndexPath)
}

class MoviesViewController: UITableViewController {
    
    var movieViewModel:MovieViewModel?
    
    let movieCellIdentifier = "MovieCellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Movies"
        movieViewModel?.delegate = self
        movieViewModel?.getMovies()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel?.movies?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCellIdentifier, for: indexPath)
        movieViewModel?.updateCell(indexPath: indexPath, cell: cell as! MovieTableViewCell)
        return cell
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        // perform segue
    }
}

extension MoviesViewController:MovieViewModelProtocol{
    func reloadTableView(){
        self.tableView.reloadData()
    }
    
    func showErrorMessage(message:String){
        
    }
}
