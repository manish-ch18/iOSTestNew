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
//MARK: View Model Class
class GridViewModel: NSObject{
    //MARK: Properties
    var number: Int = 0
    var delegate: GridViewModelDelegate?
    
    //MARK: Number is sqrt or not
    func isNumberSqurt(_ number: Int) -> (Bool, Int) {
        let sqrtNum = sqrt(Double(number))
        let isSqure = (sqrtNum * sqrtNum == Double(number))
        
        return (isSqure, Int(sqrtNum))
    }
    
    //MARK: Check text is number or not
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
