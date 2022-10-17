//
//  ViewControllerDataProvider.swift
//  Flat Earth
//
//  Created by Javad Mammadbayli on 10/17/22.
//

import Foundation

enum ParserProviderError: Error {
    case parseError
    case networkError(Request.RequestError)
    case unknownError
}

protocol ParserProvider {
    func getLaunches(completion: @escaping ([Launch]?, ParserProviderError?) -> Void)
}
