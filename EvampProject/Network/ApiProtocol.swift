//
//  ApiProtocol.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import Foundation
protocol ApiProtocol {
    func loginUser(login: LoginModel, completion: @escaping (Result<LoginResponseModel>) -> ())
    func listOfItems(listItem: ListRawBody, completion: @escaping (Result<[ListRawBodyResponse]>) -> ())
}
