//
//  CustomerHome.swift
//  HelpingHand
//
//  Created by amota511 on 1/16/18.
//  Copyright © 2018 Aaron Motayne. All rights reserved.
//

import UIKit

class CustomerHome: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    var collectionView: UICollectionView!
    var pageControl : UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create collectionview layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: self.view.bounds.width * 0.70, height: self.view.bounds.height * 0.55)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .init(top: 0, left: self.view.bounds.width * 0.15, bottom: 0, right: self.view.bounds.width * 0.15)
        flowLayout.minimumLineSpacing = self.view.bounds.width * 0.30
        flowLayout.minimumInteritemSpacing = self.view.bounds.width * 0.15
        
        //Create collectionview fgrame
        let collectionViewFrame = CGRect(origin: CGPoint(x: 0, y: self.view.bounds.height * 0.2), size: CGSize(width: self.view.bounds.width, height: self.view.bounds.height * 0.6))
        
        //Create collectionview with frame and layout
        self.collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: flowLayout)
        
        //Add collectrionview to self.view
        self.view.addSubview(collectionView)
        
        //Register collectionviewcell class
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "reuseCell")
        
        self.collectionView!.isScrollEnabled = true
        self.collectionView!.backgroundColor = .clear
        self.collectionView!.showsVerticalScrollIndicator = false
        self.collectionView!.allowsSelection = true
        self.collectionView!.alwaysBounceVertical = false
        self.collectionView!.bounces = true
        self.collectionView.isPagingEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        
        configurePageControl()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath)
        
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        cell.backgroundColor = .white
        
        
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = collectionView.indexPathsForVisibleItems[0].row
    }
    
    func configurePageControl() {
        self.pageControl = UIPageControl(frame: CGRect(x: 0, y: collectionView.frame.maxY + 5, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.alpha = 1.0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        view.addSubview(pageControl)
    }

}
