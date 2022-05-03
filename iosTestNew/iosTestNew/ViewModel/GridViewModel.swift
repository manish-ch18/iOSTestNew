//
//  GridViewModel.swift
//  iosTestNew
//
//  Created by Manish on 03/05/22.
//

import Foundation


protocol GridViewModelDelegate{
    func updateGrid(with num: Int)
}

class GridViewModel: NSObject{
    var number: Int = 0
    var delegate: GridViewModelDelegate?
    func isNumberSqurt(_ number: Int) -> (Bool, Int) {
        let sqrtNum = sqrt(Double(number))
        let isSqure = (sqrtNum * sqrtNum == Double(number))
        
        return (isSqure, Int(sqrtNum))
    }
    
    func textIsNumberOrNot(_ string: String) -> Bool{
        let decimalCharacters = CharacterSet.decimalDigits

        let decimalRange = string.rangeOfCharacter(from: decimalCharacters)

        if let decimalRange = decimalRange {
            return true
        }else{
            return false
        }
    }
    
    func setupData(){
        delegate?.updateGrid(with: number)
    }
}
