//
//  GridCell.swift
//  iosTestNew
//
//  Created by Manish on 03/05/22.
//

import UIKit

protocol GridCellDelegate{
    func buttonTapped()
}

class GridCell: UICollectionViewCell {
    
    @IBOutlet weak var gridButton: UIButton!
    
    var delegate: GridCellDelegate?
    func setupCell(at index: Int){
        gridButton.tag = index
        DispatchQueue.main.async {
            self.gridButton.cornerRadius = self.gridButton.bounds.height / 4
        }
    }
    @IBAction func gridButtonTapped(_ sender: UIButton) {
        delegate?.buttonTapped()
    }
}
