//
//  DioTableViewCell.swift
//  Table2
//
//  Created by alumno on 18/07/18.
//  Copyright © 2018 CUValles. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img: UIImageView! {
        didSet {
            img.layer.cornerRadius = 30.0
            img.clipsToBounds = true
        }
    }
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
