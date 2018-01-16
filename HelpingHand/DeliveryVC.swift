//
//  DeliveryVC.swift
//  HelpingHand
//
//  Created by amota511 on 12/30/17.
//  Copyright © 2017 Aaron Motayne. All rights reserved.
//

import UIKit

class DeliveryVC: UICollectionViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.collectionView?.delegate = self
        
        self.view?.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height)
        
        self.collectionView!.register(DeliveryItemCell.self, forCellWithReuseIdentifier: "DeliveryItemCell")
        //self.collectionView!.register(HeaderView.self, forCellWithReuseIdentifier: "HeaderView")
        self.collectionView?.register(HeaderView.self, forSupplementaryViewOfKind:  UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")
        
        self.collectionView!.isScrollEnabled = true
        //self.collectionView!.backgroundColor = UIColor(r: 85, g: 185, b: 85)
        self.collectionView!.showsVerticalScrollIndicator = false
        self.collectionView!.allowsSelection = true
        self.collectionView!.alwaysBounceVertical = true
        self.collectionView!.bounces = true
        
        let FrigeLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        FrigeLayout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
        FrigeLayout.itemSize = CGSize(width: view.frame.width * (1/3), height: view.frame.height * (1/3) * (3/4))
        
        self.collectionView!.collectionViewLayout = FrigeLayout
        
        //self.collectionView!.collectionViewLayout.section //sectionHeadersPinToVisibleBounds = true
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeliveryItemCell", for: indexPath) as! DeliveryItemCell
        
        //cell.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        cell.backgroundColor = UIColor.blue
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        
        header.backgroundColor = UIColor.green
        
        header.frame = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width: 50, height: 50))
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width:view.frame.size.width, height:100.0)
        
    }
    
    
    
}
