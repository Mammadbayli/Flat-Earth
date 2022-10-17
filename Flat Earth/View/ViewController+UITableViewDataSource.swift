//
//  ViewControlelr+UITableViewDataSource.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/17/22.
//

import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let launch = launches[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? LaunchDetailCellView else {
            return UITableViewCell()
        }
        
      
        cell.launch = launch
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launches.count
    }
}
