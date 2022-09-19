//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by Mohamed Khaled on 13/09/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBut: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var slides = [OnboardingSlide]() // create arr from struct
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage // to update page controller
            if currentPage == slides.count-1 {
                nextBut.setTitle("Get Started", for: .normal)
            }else{
                nextBut.setTitle("Next", for: .normal)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [ OnboardingSlide ( title : " Delicious Dishes " , description : " Experience a variety of amazing dishes from different cultures around the world . " , image : UIImage(named:"slide1")!) , OnboardingSlide ( title : " World - Class Chefs " , description : " Our dishes are prepared by only the best . " , image :UIImage(named:"slide2")!) , OnboardingSlide ( title : " Instant World - Wide Delivery " , description : " Your orders will be delivered instantly irrespective of your location around the world . " , image :UIImage(named:"slide3")!) ]
        
        pageControl.numberOfPages = slides.count

    }
    
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        // to controll next button change image
        if currentPage == slides.count-1{
            let storyboard = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as!UINavigationController
            storyboard.modalPresentationStyle = .fullScreen
            storyboard.modalTransitionStyle = .flipHorizontal // layout to change page
            UserDefaults.standard.hasOnboarded = true // عشان اعرف انه مش اول مره يفتح التطبيق
            present(storyboard, animated: true, completion: nil)
            
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    


}

typealias collectionView_Delgate_DataSource_FlowLayout = UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

extension OnboardingViewController : collectionView_Delgate_DataSource_FlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        // بدل م ا اقعد استدعيهم استدعي المشود اللي عملته
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width // to controll in page controll ...
        currentPage = Int(scrollView.contentOffset.x/width)
        
    }
}
