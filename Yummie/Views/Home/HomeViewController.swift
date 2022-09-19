//
//  HomeViewController.swift
//  Yummie
//
//  Created by Mohamed Khaled on 14/09/2022.
//

import UIKit
import ProgressHUD
class HomeViewController: UIViewController {
    @IBOutlet weak var FoodCategoryCollectionView: UICollectionView!
    @IBOutlet weak var PopularCollectionView: UICollectionView!
    @IBOutlet weak var ChefDishesCollectionView: UICollectionView!
    var categories: [DishCategory] = []
    var populars: [Dish] = []
    var specials: [Dish] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.FoodCategoryCollectionView.reloadData()
                self?.PopularCollectionView.reloadData()
                self?.ChefDishesCollectionView.reloadData()
                case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        FoodCategoryCollectionView.delegate = self
        FoodCategoryCollectionView.dataSource = self
        FoodCategoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        //
        PopularCollectionView.delegate = self
        PopularCollectionView.dataSource = self
        PopularCollectionView.register(UINib(nibName: "PopularCollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "PopularCollectionViewCell")
        //
        ChefDishesCollectionView.delegate = self
        ChefDishesCollectionView.dataSource = self
        ChefDishesCollectionView.register(UINib(nibName: "ChefDishesCollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: "ChefDishesCollectionViewCell")
    }
    

}

extension HomeViewController : collectionView_Delgate_DataSource_FlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == FoodCategoryCollectionView {
        return categories.count // ret. number
        }else if collectionView == PopularCollectionView {
            return populars.count
        }else{
            return specials.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == FoodCategoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        }else if collectionView == PopularCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as! PopularCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChefDishesCollectionViewCell", for: indexPath) as! ChefDishesCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == FoodCategoryCollectionView {
            let controller = LIstDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else{
            let controller = DishDetailsViewController.instantiate()
            // fc هنا انا بقوله قم بعض الصوره التي تم اختياره في الشاشه التاليه مع العلم ان لا يمكن الاختيار الا من الاطباق المشهوره والشيف
            controller.dish = collectionView == PopularCollectionView ? populars[indexPath.row] : specials[indexPath.row] // important
            // dish object of view controller in main storyboard
            navigationController?.pushViewController(controller, animated: true)
            
        }
    }
    
}
