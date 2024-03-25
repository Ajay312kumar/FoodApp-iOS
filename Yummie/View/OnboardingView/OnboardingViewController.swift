//
//  OnboardingViewController.swift
//  GroceryApp
//
//  Created by Ajay Kumar on 14/03/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var onBoardingCollectionView: UICollectionView!
    @IBOutlet weak var nextPageController: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    

    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            nextPageController.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle(Constant.getStarted, for: .normal)
            }else{
                nextButton.setTitle(Constant.next, for: .normal)
            }
        }
        
    }
    
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
        slides = [OnboardingSlide(title: "Welcome", description: "Welcome to our app!", image: UIImage(named: "slide1")!),
                  OnboardingSlide(title: "Welcome", description: "Welcome to our app!", image: UIImage(named: "slide2")!),
                  OnboardingSlide(title: "Welcome", description: "Welcome to our app!", image: UIImage(named: "slide3")!)
        ]

        
        onBoardingCollectionView.delegate = self
        onBoardingCollectionView.dataSource = self
        
        intitialSetUp()
        if let layout = onBoardingCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: 393, height: 700)
        }
        
    }
    
    func intitialSetUp() {
        
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
        
    }
    
    
    //MARK: Actions
    @IBAction func nextButtonAction(_ sender: UIButton) {
        
        if currentPage == slides.count - 1 {
            if let navigationController = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as? UINavigationController {
                navigationController.modalTransitionStyle = .flipHorizontal
                navigationController.modalPresentationStyle = .fullScreen
                present(navigationController, animated: true, completion: nil)
            }
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onBoardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = onBoardingCollectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: onBoardingCollectionView.frame.width, height: onBoardingCollectionView.frame.height)
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        nextPageController.currentPage = currentPage
    }
    
}
