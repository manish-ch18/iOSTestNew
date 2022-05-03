//
//  GridCell.swift
//  iosTestNew
//
//  Created by Manish on 03/05/22.
//

import UIKit

//MARK:  Protocol for button tap
protocol GridCellDelegate{
    func buttonTapped(with index: Int)
}

class GridCell: UICollectionViewCell {
    
    //MARK: Properties
    @IBOutlet weak var gridButton: UIButton!
    var delegate: GridCellDelegate?
    
    //MARK: Setup collectionview cell
    func setupCell(at index: Int, with item: GridModel){
        gridButton.tag = index
        DispatchQueue.main.async {
            self.gridButton.cornerRadius = self.gridButton.bounds.height / 4
            if item.isGotColor{
                self.gridButton.backgroundColor = .red
                self.gridButton.isUserInteractionEnabled = true
                if item.isGotSelected{
                    self.gridButton.backgroundColor = .blue
                    self.gridButton.isUserInteractionEnabled = false
                }
            }else{
                self.gridButton.backgroundColor = .white
                self.gridButton.isUserInteractionEnabled = false
            }
        }
    }
    
    //MARK: Button Tap
    @IBAction func gridButtonTapped(_ sender: UIButton) {
        delegate?.buttonTapped(with: sender.tag)
    }
}
