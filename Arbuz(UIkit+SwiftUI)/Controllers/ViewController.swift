//
//  ViewController.swift
//  Arbuz(UIkit+SwiftUI)
//
//  Created by Yerkebulan Serikov on 28.05.2022.
//

import UIKit

class ViewController: UIViewController{
    
    var collectionView: UICollectionView?
    
    var layoutCollection: UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        view.addSubview(collectionView ?? UIView())
        navigationController?.navigationBar.isHidden = true
        
    }
    
    private func setupCollectionView(){
        layoutCollection.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layoutCollection.itemSize = CGSize(width: (self.view.frame.width/3)-30, height: 190)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layoutCollection)
        collectionView?.register(CustomCellCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView?.backgroundColor = UIColor.white
    }


}

extension ViewController : UICollectionViewDelegate{
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomCellCollectionViewCell
        myCell.setupView(product: Constants.watermellon)
        myCell.backgroundColor = UIColor.blue
        return myCell
    }

}

