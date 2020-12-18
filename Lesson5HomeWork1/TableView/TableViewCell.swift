//
//  TableViewCell.swift
//  Lesson5HomeWork1
//
//  Created by Mac on 18.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    weak var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(index: Int, delegate: TableViewCellDelegate) {
        self.delegate = delegate
        label.text = "\(index) cell" }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
    }

    @IBAction func someButtonTapped(sender: UIButton) {
        UIView.animate(withDuration: 0.15) {
            self.button.alpha = 0.5
                } completion: { finished in if(finished) {
                    UIView.animate(withDuration: 0.15) {
                        self.button.alpha = 1
                    } completion: { finished in }
                }
                }
        self.delegate?.buttonTapped(cell: self)
    }
}


protocol TableViewCellDelegate: class {
    func buttonTapped(cell: TableViewCell)
}
