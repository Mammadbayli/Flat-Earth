//
//  ViewController+UITableViewDelegate.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/17/22.
//

import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let laumch = launches[indexPath.row]
        showDetailViewController(LaunchDetailViewController(launch: laumch), sender: nil)
    }
}
