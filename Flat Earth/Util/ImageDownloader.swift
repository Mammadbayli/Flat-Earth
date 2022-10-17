//
//  ImageDownloader.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/17/22.
//

import Foundation
import UIKit

typealias ImageDownloaderCallback = (UIImage?, Error?) -> Void

class ImageDownloader {
    static let shared = ImageDownloader()
    
    fileprivate var cache = [URL: UIImage]()
    fileprivate var inProgress = Set<URL>()
    fileprivate var callbacksDict = [URL: [ImageDownloaderCallback]]()
    fileprivate let queue = DispatchQueue(label: "queue")
    
    private init() {
        
    }
    
    func addCallbackFor(url: URL, callback: @escaping ImageDownloaderCallback) {
        if let callbacks = callbacksDict[url] {
            var cbs = callbacks
            cbs.append(callback)
            callbacksDict[url] = cbs
        } else {
            callbacksDict[url] = [callback]
        }
    }
    
    func removeCallbacksFor(url: URL) {
        callbacksDict[url] = nil
    }
    
    func callCallbacksForURL(url: URL) {
        if let callbacks = callbacksDict[url] {
            for callback in callbacks {
                callback(cachedImageForURL(url: url), nil)
            }
        }
        
        removeCallbacksFor(url: url)
    }
    
    func cachedImageForURL(url: URL) -> UIImage? {
        if let image = cache[url] {
            return image
        }
        
        return nil
    }
    
    func downloadImageFrom(url: URL, completion: @escaping ImageDownloaderCallback) {
        if let image = cachedImageForURL(url: url) {
            completion(image, nil)
        } else {
            if callbacksDict[url] == nil {
                DispatchQueue.global(qos: .userInitiated).async {
                    do {
                        let data = try Data(contentsOf: url)
                        let image = UIImage(data: data)
                        
                        self.queue.async {
                            self.cache[url] = image
                            self.callCallbacksForURL(url: url)
                        }
                    } catch {
                        self.queue.async {
                            self.callCallbacksForURL(url: url)
                        }
                    }
                }
            }
            
            addCallbackFor(url: url, callback: completion)
        }
    }
}
