//
//  LoginViewModel.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import Foundation



class LoginViewModel {
    var postData = [LoginResponseModel]()
    var myProtocol : ApiProtocol
    
    init(protocolArgument : ApiProtocol){
        myProtocol  = protocolArgument
    }
    
    func loginUser(login: LoginModel, completionHandler: @escaping (Result<[LoginResponseModel]>) -> ()){
        myProtocol.loginUser(login: login) { respone in
            switch respone {
            case let .success(data):
                self.postData = data
                print("Api call Successfully")
                print(self.postData)
            case .failure(_):
                print("error")
            }
        }
    }
}

