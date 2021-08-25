//
//  LoginViewModel.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import Foundation



class LoginViewModel {
    var myProtocol : ApiProtocol
    
    init(protocolArgument : ApiProtocol){
        myProtocol  = protocolArgument
    }
    var loginResponseModel: LoginResponseModel?
//    let loginInstance = LoginModel(userEmail: "demo@evampsaanga.com", password: "demo@123")

    
    func loginUser(login: LoginModel, completion: @escaping (Result<LoginResponseModel>) -> ()){
        myProtocol.loginUser(login: login, completion: { result in
            switch result {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
              print(error)
            }
        })
    }
    
}

