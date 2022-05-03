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
    
    var gridVM = GridViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func submitButtonAction(_ sender: UIButton) {
    }
    
}

extension GridViewController: UITextFieldDelegate{
    
}
 

extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! GridCell
        cell.setupCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width / 3
        let height = collectionView.bounds.size.height / 3
        
        return CGSize(width: width, height: height)
    }
    
    
}

