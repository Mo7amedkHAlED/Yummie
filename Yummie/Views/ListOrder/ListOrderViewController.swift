//
//  ListOrderViewController.swift
//  Yummie
//
//  Created by Mohamed Khaled on 16/09/2022.
//

import UIKit
import ProgressHUD

class ListOrderViewController: UIViewController {
    var orders : [Order] = [ ]
    @IBOutlet weak var ListOrderTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "orders"
        ListOrderTableView.register(UINib(nibName: "DishListTableViewCell", bundle: nil ),forCellReuseIdentifier: "DishListTableViewCell")
    }
// to loading after adding inf
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [weak self](result) in
            switch result {
            case .success(let orders):
            ProgressHUD.dismiss()
            self?.orders=orders
            self?.ListOrderTableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }


}
extension ListOrderViewController:TabelView_Delgate_DataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DishListTableViewCell", for: indexPath) as! DishListTableViewCell
        cell.setup(order:orders[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate() // go to page
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
