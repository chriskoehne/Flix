//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Chris Koehne on 2/1/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
//        print(movie!)

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
//        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        let numVotes = movie["vote_count"] as! Int
        let rating = movie["vote_average"] as! Double
        ratingLabel.text = String(format: "%.1f / 10 \n(\(numVotes) ratings)", rating)
        ratingLabel.sizeToFit()
        
        let basePosterUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: basePosterUrl + posterPath)
        posterView.af.setImage(withURL: posterUrl!)
        
        let baseBackdropUrl = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: baseBackdropUrl + backdropPath)
        backdropView.af.setImage(withURL: backdropUrl!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
