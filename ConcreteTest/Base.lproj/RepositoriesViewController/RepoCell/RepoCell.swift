//
//  RepoCell.swift
//  ConcreteTest
//
//  Created by Vinicius on 12/09/16.
//  Copyright © 2016 vm. All rights reserved.
//

import UIKit
import SDWebImage

class RepoCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubtitle: UILabel!
    @IBOutlet weak var forksCount: UILabel!
    @IBOutlet weak var starsCount: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var full_name: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    func setupCell(cellProtocol: RepoCellRepresentation){
        self.cellTitle.text = cellProtocol.setCellTitle()
        self.cellSubtitle.text = cellProtocol.setCellSubtitle()
        self.forksCount.text = cellProtocol.setForksCount()
        self.starsCount.text = cellProtocol.setStarsCount()
        self.profileImg.sd_setImageWithURL(NSURL(string: cellProtocol.setImageProfileName()), placeholderImage:UIImage())
    }
}
