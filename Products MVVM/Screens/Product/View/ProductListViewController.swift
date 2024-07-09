//
//  ProductListViewController.swift
//  Products MVVM
//
//  Created by Preet Pambhar on 2024-05-03.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    private var ViewModel = ProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
       configuration()
    }
}

extension ProductListViewController{
    func configuration(){
        productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        initViewModel()
        observeEvent()
    }
    func initViewModel(){
        ViewModel.fetchProducts()
    }
    
    //Data Binding event observe karega  - communication
    func observeEvent(){
        ViewModel.eventHandler = { [weak self] event in
            guard let self else{ return }
            
            switch event{
            case .loading:
                print("Product loading.....")
            case .stopLoading:
                print("Stop loading Product...")
            case .dataLoaded:
                print("Data Loaded .....")
                DispatchQueue.main.async {
                    //UI main works well 
                    self.productTableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }
}


extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ViewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else{
            return UITableViewCell()
        }
        let product = ViewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
}
