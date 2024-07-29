//
//  ArticleDetailViewController.swift
//  PopularArticles
//
//  Created by nargis hameed on 28/07/2024.
//


import Foundation
import UIKit


class ArticleDetailViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorDetails: UILabel!
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    var viewModel : ArticleDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setupUI()  {

        
        self.heading.text = viewModel?.heading
        self.descriptionLabel.text = viewModel?.detailsText
        self.authorDetails.text = viewModel?.authorText
        self.dateLabel.text = viewModel?.dateText
        self.ImageView.imageFromServerURL(viewModel?.imageUrl ?? "",placeHolder: UIImage(named: "placeholder"))
        
    }
    
    
}
