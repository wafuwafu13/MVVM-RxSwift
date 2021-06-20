//
//  ViewController.swift
//  MVVMRxSwift
//
//  Created by 田川　裕隆 on 2021/06/20.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private var viewModel: RestaurantsListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    static func instantiate(viewModel: RestaurantsListViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//      let service = RestaurantService()
//      service.fetchRestaurants().subscribe(onNext: { restaurants in
//          print(restaurants)
//      }).disposed(by: disposeBag)
        
        tableView.tableFooterView = UIView()
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        
        viewModel.fetchRestaurantViewModels().observe(on: MainScheduler.instance).bind(to:
            tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
    }
}
