//
//  listItemViewModel.swift
//  EvampProject
//
//  Created by Naveed Tahir on 25/08/2021.
//

import Foundation


class listItemViewModel {
    var myProtocol : ApiProtocol
    
    init(protocolArgument : ApiProtocol){
        myProtocol  = protocolArgument
    }
    var itemData = [ListRawBodyResponse]()
    var listResponseModel: ListRawBodyResponse?
    //    let loginInstance = LoginModel(userEmail: "demo@evampsaanga.com", password: "demo@123")
    
    func listOfItems(listItem: ListRawBody, completion: @escaping (Result<[ListRawBodyResponse]>) -> ()) {
        myProtocol.listOfItems(listItem: listItem) { result in
            switch result{
            case .success(let success):
                self.itemData = success
                completion(.success(self.itemData))
            case .failure(let err):
                completion(.failure(err))
                print(err)
            }
        }
    }
    
}
