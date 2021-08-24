//
//  Result.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
