//
//  DishDetailsViewController.swift
//  Yummie
//
//  Created by Mohamed Khaled on 15/09/2022.
//

import UIKit
import ProgressHUD

class DishDetailsViewController: UIViewController {
    @IBOutlet weak var DishDetailsImageView: UIImageView!
    @IBOutlet weak var DishDetailsNameLabel: UILabel!
    @IBOutlet weak var DishDetailsCaloriesLabel: UILabel!
    @IBOutlet weak var DishDetailsDescripeLabel: UILabel!
    @IBOutlet weak var UserNameLabel: UITextField!
    var dish: Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()

    }
    private func populateView() {
        DishDetailsImageView.kf.setImage(with: dish.image?.asUrl)
        DishDetailsNameLabel.text = dish.name
        DishDetailsDescripeLabel.text = dish.description
        DishDetailsCaloriesLabel.text = dish.formattedCalories
    }
    
    @IBAction func PlaceOrderButton(_ sender: UIButton) {
        guard let name = UserNameLabel.text?.trimmingCharacters(in: .whitespaces),
              !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        
        ProgressHUD.show("Placing Order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received. 👨🏼‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
}
