//
//  ApiProtocol.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import Foundation
protocol ApiProtocol {
    func loginUser(login: LoginModel, completionHandler: @escaping (Result<[LoginResponseModel]>) -> ())
}
