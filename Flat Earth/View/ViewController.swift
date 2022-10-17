//
//  ViewController.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/16/22.
//

import UIKit

class ViewController: UIViewController {
    let cellId = "cellId"
    var dataProvider: ParserProvider!
    var launches = [Launch]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    fileprivate lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.delegate = self
        tb.dataSource = self
        tb.register(LaunchDetailCellView.self, forCellReuseIdentifier: cellId)
        
        let label = UILabel()
        label.text = "Loading..."
        label.textAlignment = .center
        
        tb.backgroundView = label
        
        
        return tb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataProvider.getLaunches {[weak self] _launches, _error in
            guard let _launches else { return }
            
            DispatchQueue.main.async {
                self?.launches = _launches
            }
        }
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    init(dataProvider: ParserProvider) {
        super.init(nibName: nil, bundle: nil)
        self.dataProvider = dataProvider
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

