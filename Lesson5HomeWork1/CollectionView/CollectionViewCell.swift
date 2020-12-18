//
//  CollectionViewCell.swift
//  Lesson5HomeWork1
//
//  Created by Mac on 18.12.2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUp(index: Int) {
        label.text = "\(index) cell"
        
        if (index % 2 != 0) {
            label.textColor = .white
            self.backgroundColor = .blue
        }
        else {
            label.textColor = .black
            self.backgroundColor = .yellow}
    }
    

}
