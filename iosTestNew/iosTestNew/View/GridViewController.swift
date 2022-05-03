//
//  GridViewController.swift
//  iosTestNew
//
//  Created by Manish on 03/05/22.
//

import UIKit

class GridViewController: UIViewController {

    @IBOutlet weak var numberTextfield: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var gridVM = GridViewModel()
    var number = 0
    var maxNumberAllowed = 100
    var arrayGrid = [GridModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextfield.becomeFirstResponder()
        gridVM.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonAction(_ sender: UIButton) {
        numberTextfield.resignFirstResponder()
        guard let text = numberTextfield.text, !text.isEmpty else{
            return
        }
        
        if !gridVM.textIsNumberOrNot(numberTextfield.text ?? ""){
            showAlert(title: "Error", message: "Only squre root number allowed.", buttonTitle: "OK")
            return
        }
        
        if let number = Int(text){
            let sqrtNum = gridVM.isNumberSqurt(number)
            if number > maxNumberAllowed{
                showAlert(title: "Error", message: "You can enter upto \(maxNumberAllowed) number.", buttonTitle: "OK")
            }else{
                if !sqrtNum.0{
                    showAlert(title: "Error", message: "Only squre root number allowed.", buttonTitle: "OK")
                }else{
                    gridVM.number = sqrtNum.1
                    gridVM.setupData()
                }
            }
            
        }else{
            showAlert(title: "Error", message: "Only squre root number allowed.", buttonTitle: "OK")
        }
        
        
    }
    
}
 

extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayGrid.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCell
        cell.setupCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let floatNumber = CGFloat(self.number)
        let width = collectionView.bounds.size.width / floatNumber
        let height = collectionView.bounds.size.height / floatNumber
        
        return CGSize(width: width, height: height)
    }
}

extension GridViewController: GridViewModelDelegate{
    func updateGrid(with num: Int) {
        self.number = num
        self.arrayGrid.removeAll()
        for _ in 1...num{
            arrayGrid.append(GridModel())
        }
        
        collectionView.reloadData()
    }
}

extension GridViewController: GridCellDelegate{
    func buttonTapped() {
        collectionView.reloadData()
    }
}

