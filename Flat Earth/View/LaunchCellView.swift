//
//  LaunchCellView.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/17/22.
//

import UIKit

class LaunchDetailCellView: UITableViewCell {
    var loadedImage: UIImage? {
        didSet {
            setNeedsUpdateConfiguration()
        }
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var content = self.defaultContentConfiguration().updated(for: state)
        content.image = self.loadedImage ?? UIImage(systemName: "person.fill")
        content.text = launch.missionName
        content.imageProperties.reservedLayoutSize = CGSize(width: 50, height: 50)
        self.contentConfiguration = content
    }
    
    var launch: Launch! {
        didSet {
            loadedImage = nil
            if let url = launch.links.missionPatch {
                ImageDownloader.shared.downloadImageFrom(url: url) {[weak self] image, error in
                        DispatchQueue.main.async {
                            if let image {
                                self?.loadedImage = image
                            } else {
                                self?.loadedImage = UIImage(systemName: "person.fill")
                            }
                        }
                }
            } else {
                self.loadedImage = UIImage(systemName: "person.fill")
            }
            
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        loadedImage = nil
    }
}

