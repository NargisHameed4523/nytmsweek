//
//  ArticleRowCellTableViewCell.swift
//  PopularArticles
//
//  Created by nargis hameed on 28/07/2024.
//

import UIKit
class ArticleRowCellTableViewCell: UITableViewCell {
    @IBOutlet weak var bgVw: UIView!
    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var timelb: UILabel!
    @IBOutlet weak var descp: UILabel!
    @IBOutlet weak var imageVw: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupUI() {
        bgVw.layer.cornerRadius = 8.0
        
    }
}
