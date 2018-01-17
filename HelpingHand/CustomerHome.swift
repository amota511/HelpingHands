//
//  CustomerHome.swift
//  HelpingHand
//
//  Created by amota511 on 1/16/18.
//  Copyright © 2018 Aaron Motayne. All rights reserved.
//

import UIKit

class CustomerHome: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    var titleLabel: UILabel!
    var collectionView: UICollectionView!
    var pageControl : UIPageControl!
    
    let images = [#imageLiteral(resourceName: "HH_car_icon"),#imageLiteral(resourceName: "HH_delivery_icon"),#imageLiteral(resourceName: "HH_house_icon"),#imageLiteral(resourceName: "HH_profile_icon")]
    let titles = ["Transportation", "Delivery", "Home Care", "Settings"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTitleLabel()
        configureCollectionView()
        configurePageControl()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0) {
            self.titleLabel.alpha = 1.0
            self.collectionView.alpha = 1.0
            self.pageControl.alpha = 1.0
            
            self.titleLabel.frame.origin.y = self.titleLabel.frame.origin.y - 15
            self.collectionView.frame.origin.y = self.collectionView.frame.origin.y - 15
            self.pageControl.frame.origin.y = self.pageControl.frame.origin.y - 15
        }
    }
    
    func configureTitleLabel() {
        titleLabel = UILabel(frame: CGRect(origin: CGPoint(x: 8, y: 35), size: CGSize(width: self.view.bounds.width - 8, height: self.view.bounds.height * 0.15)))
        titleLabel.text = "Helping Hands"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.shadowOffset = CGSize(width: 1, height: -1)
        titleLabel.shadowColor = UIColor.darkGray
        
        titleLabel.numberOfLines = 1
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        self.view.addSubview(titleLabel)
        
        titleLabel.alpha = 0
    }
    
    func configureCollectionView() {
        
        //Create collectionview layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: self.view.bounds.width * 0.70, height: self.view.bounds.height * 0.55)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = .init(top: 0, left: self.view.bounds.width * 0.15, bottom: 0, right: self.view.bounds.width * 0.15)
        flowLayout.minimumLineSpacing = self.view.bounds.width * 0.30
        flowLayout.minimumInteritemSpacing = self.view.bounds.width * 0.15
        
        //Create collectionview fgrame
        let collectionViewFrame = CGRect(origin: CGPoint(x: 0, y: (self.view.bounds.height * 0.2) + 15), size: CGSize(width: self.view.bounds.width, height: self.view.bounds.height * 0.6))
        
        //Create collectionview with frame and layout
        self.collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: flowLayout)
        
        //Add collectrionview to self.view
        self.view.addSubview(collectionView)
        
        //Register collectionviewcell class
        self.collectionView.register(HomeCell.self, forCellWithReuseIdentifier: "reuseCell")
        
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
        
        self.collectionView.alpha = 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath) as! HomeCell
        
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        cell.backgroundView = RadialGradientView()
        let gradient = cell.backgroundView as! RadialGradientView
        gradient.firstColor = UIColor(r: 255, g: 204, b: 93)
        gradient.secondColor = UIColor(r: 255, g: 55, b: 62)
       
        let img = cell.image
        img.tintColor = .white
        img.tintColorDidChange()
        
        img.frame = CGRect(x: 5, y: 10, width: cell.bounds.width - 10, height: cell.bounds.height * 0.7)
        img.image = images[indexPath.row]
        img.contentMode = .scaleAspectFit
        
        if cell.image.superview != cell {
            cell.addSubview(img)
        }
        
        let title = cell.title
        
        title.frame = CGRect(origin: CGPoint(x: 15, y: cell.bounds.height * 0.6), size: CGSize(width: cell.bounds.width * 0.95, height: cell.bounds.height * 0.4))
        title.text = titles[indexPath.row]
        title.textColor = .white
        title.textAlignment = .left
        
        title.numberOfLines = 1
        
        title.font = UIFont.boldSystemFont(ofSize: 30)
        
        if cell.title.superview != cell {
            cell.addSubview(title)
        }
        
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = collectionView.indexPathsForVisibleItems[0].row
    }
    
    func configurePageControl() {
        self.pageControl = UIPageControl(frame: CGRect(x: 0, y: collectionView.frame.maxY + 20, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.alpha = 1.0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.alpha = 0
        view.addSubview(pageControl)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}

