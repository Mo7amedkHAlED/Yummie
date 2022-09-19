//
//  LIstDishesViewController.swift
//  Yummie
//
//  Created by Mohamed Khaled on 16/09/2022.
//

import UIKit
import ProgressHUD
class LIstDishesViewController: UIViewController {
    @IBOutlet weak var listDishesTabelView: UITableView!
    var category: DishCategory!
    var dishes : [Dish] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.name
        listDishesTabelView.register(UINib(nibName: "DishListTableViewCell", bundle: nil ),forCellReuseIdentifier: "DishListTableViewCell")
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self] (result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.listDishesTabelView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
}
typealias TabelView_Delgate_DataSource = UITableViewDelegate & UITableViewDataSource

extension LIstDishesViewController : TabelView_Delgate_DataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishListTableViewCell", for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate() // go to page
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
