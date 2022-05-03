//
//  GridViewModel.swift
//  iosTestNew
//
//  Created by Manish on 03/05/22.
//

import Foundation


class GridViewModel: NSObject{
    var number: Int = 0
    func isNumberSqurt(_ number: Int) -> (Bool, Int) {
        let sqrtNum = sqrt(Double(number))
        let isSqure = (sqrtNum * sqrtNum == Double(number))
        return (isSqure, Int(sqrtNum))
    }
}
