import Foundation


struct Movie{
    let baseImageURL = "https://image.tmdb.org/t/p/w500"
    let poster_path:String
    let overview:String
    let adult:Bool
    let releaseDate:String
    let genre_ids:[Int]
    let id:Int
    let original_title:String
    let original_language:String
    let title:String
    let backdrop_path:String
    let popularity:Int
    let vote_count:Int
    let video:Bool
    let vote_average:Float

    
    public init?(data:[String:AnyObject]){
        
        self.poster_path = data["poster_path"] as! String? ?? ""
        self.overview = data["overview"] as! String? ?? ""
        self.adult = data["adult"] as! Bool? ?? false
        self.releaseDate = data["releaseDate"] as! String? ?? ""
        self.genre_ids = data["genre_ids"] as! [Int]? ?? [Int]()
        self.id = data["id"] as! Int? ?? 0
        self.original_title = data["original_title"] as! String? ?? ""
        self.original_language = data["original_language"] as! String? ?? ""
        self.title = data["title"] as! String? ?? ""
        self.backdrop_path = data["backdrop_path"] as! String? ?? ""
        self.popularity =  data["popularity"] as! Int?  ?? 0
        self.vote_count = data["vote_count"] as! Int?  ?? 0
        self.video = data["video"] as! Bool? ?? false
        self.vote_average = data["vote_average"] as! Float?  ?? 0
    }
    
    func imageURLPath()->String{
        return baseImageURL + poster_path
    }
}
