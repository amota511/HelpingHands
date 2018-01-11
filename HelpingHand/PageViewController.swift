//
//  ViewController.swift
//  HelpingHand
//
//  Created by amota511 on 12/28/17.
//  Copyright © 2017 Aaron Motayne. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    var pageControl = UIPageControl()
    
    var topLabel: UILabel!
    
    var pageTitle: UILabel!
    var pageDescription: UILabel!
    
    var loginButton: UIButton!
    var signUpButton: UIButton!
    
    var titles = ["Transportation", "Delivery", "Care"]
    var descriptions = ["It's our job to get you or your loved one from point A to point B.", "We'll handle picking up your medication and bring it straight to your bedside.", "Cooking and baths are all handled relieving you of any unneccessary stress."]
    
    lazy var subViewControllers: [UIViewController] = {
        return [
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VIewController01") as! ViewController01,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VIewController02") as! ViewController02,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VIewController03") as! ViewController03,
        //UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VIewController04") as! ViewController04
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self

        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        
        
        createTopLabel()
        
        createLoginButton()
        createSignUpButton()
        configurePageControl()
        createPageDescription()
        createPageTitle()
    }
    
    func createTopLabel() {
        
        let topLabelFrame = CGRect(x: 0, y: self.view.frame.height * 0.05, width: self.view.frame.width , height: self.view.frame.height * 0.1)
        
        topLabel = UILabel(frame: topLabelFrame)
        
        topLabel.text = "Helping Hand"
        topLabel.textAlignment = .center
        topLabel.textColor = UIColor.white
        topLabel.adjustsFontSizeToFitWidth = true
        topLabel.font = topLabel.font.withSize(30)
        
        view.addSubview(topLabel)
    }
    
    func createPageTitle() {
        
        let pageTitleFrame = CGRect(x: self.view.frame.midX - self.view.frame.width * 0.35, y:  pageDescription.frame.minY - self.view.frame.height * 0.075, width: self.view.frame.width * 0.7 , height: self.view.frame.height * 0.075)
        
        pageTitle = UILabel(frame: pageTitleFrame)
        
        pageTitle.text = titles[0]
        pageTitle.textAlignment = .center
        pageTitle.textColor = UIColor.white
        pageTitle.adjustsFontSizeToFitWidth = true
        pageTitle.font = pageTitle.font.withSize(30)
        
        view.addSubview(pageTitle)
    }
    
    func createPageDescription() {
        
        let pageDescriptionFrame = CGRect(x: self.view.frame.midX - self.view.frame.width * 0.45, y: pageControl.frame.minY - self.view.frame.height * 0.1, width: self.view.frame.width * 0.9, height: self.view.frame.height * 0.1)
        
        pageDescription = UILabel(frame: pageDescriptionFrame)

        pageDescription.text = descriptions[0]
        pageDescription.textAlignment = .center
        pageDescription.textColor = UIColor.white
        pageDescription.numberOfLines = 0
        pageDescription.font = pageDescription.font.withSize(18)
        
        view.addSubview(pageDescription)
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: loginButton.frame.minY - 50 - 5, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = subViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.alpha = 0.5
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    
    func createLoginButton() {
        
        loginButton = UIButton(type: .system)
        
        let loginButtonFrame = CGRect(x: self.view.frame.width * 0.025, y: self.view.frame.height * 0.915, width: self.view.frame.width * 0.45, height: self.view.frame.height * 0.07)
        
        loginButton.frame = loginButtonFrame
        loginButton.backgroundColor = UIColor.lightGray
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleLabel?.font = loginButton.titleLabel?.font.withSize(22)
        
        loginButton.layer.cornerRadius = 3.5
        loginButton.clipsToBounds = true
        
        view.addSubview(loginButton)
    }
    
    func createSignUpButton() {
        
        signUpButton = UIButton(type: .system)
        
        let signUpButtonFrame = CGRect(x: self.view.frame.width * 0.525, y: self.view.frame.height * 0.915, width: self.view.frame.width * 0.45, height: self.view.frame.height * 0.07)
        
        signUpButton.frame = signUpButtonFrame
        signUpButton.backgroundColor = UIColor.orange
        
        signUpButton.setTitle("Create Account", for: .normal)
        signUpButton.setTitleColor(UIColor.white, for: .normal)
        signUpButton.titleLabel?.font = signUpButton.titleLabel?.font.withSize(22)
        
        signUpButton.layer.cornerRadius = 3.5
        signUpButton.clipsToBounds = true
        
        view.addSubview(signUpButton)
    }
    
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let pageContentViewController = pageViewController.viewControllers![0]
        let index = subViewControllers.index(of: pageContentViewController)!
        
        self.pageControl.currentPage = index
        self.pageTitle.text = titles[index]
        self.pageDescription.text = descriptions[index]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if (currentIndex <= 0) {
            return nil
        }
        return subViewControllers[currentIndex - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?  {
        let currentIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if (currentIndex >= subViewControllers.count - 1) {
            return nil
        }
        return subViewControllers[currentIndex + 1]
    }
}

