//
//  GridCell.swift
//  iosTestNew
//
//  Created by Manish on 03/05/22.
//

import UIKit

class GridCell: UICollectionViewCell {
    
    @IBOutlet weak var gridButton: UIButton!
    
    func setupCell(){
        DispatchQueue.main.async {
            self.gridButton.cornerRadius = self.gridButton.bounds.height / 4
        }
    }
}
