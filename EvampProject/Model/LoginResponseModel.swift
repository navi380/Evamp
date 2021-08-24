//
//  LoginResponseModel.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import Foundation


struct LoginResponseModel:Codable {
    var success: String
    var userInfo: UserInfo?
}

struct UserInfo:Codable {
    let token: String
    let profileImage: String
    let name: String
    let email: String
    let welcomeMessage: String
}
