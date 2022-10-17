//
//  LaunchDetailViewController.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/17/22.
//

import Foundation
import UIKit

class LaunchDetailViewController: UIViewController {
    fileprivate var launch: Launch!
    
    fileprivate lazy var launchNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = launch.missionName
        return label
    }()
    init(launch: Launch) {
        super.init(nibName: nil, bundle: nil)
        self.launch = launch
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(launchNameLabel)
        
        NSLayoutConstraint.activate([
            launchNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            launchNameLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            launchNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            launchNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
