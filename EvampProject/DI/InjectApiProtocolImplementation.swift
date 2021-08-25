//
//  InjectApiProtocolImplementation.swift
//  EvampProject
//
//  Created by Naveed Tahir on 24/08/2021.
//

import Foundation

class Injection{
    static let provide = Injection()


    func LoiginApiProtocolInjection() -> LoginViewModel{
        return LoginViewModel(protocolArgument: ApiProtocolImplementationService.shared)
    }
    
    func ListItemsApiProtocolInjection() -> listItemViewModel{
        return listItemViewModel(protocolArgument: ApiProtocolImplementationService.shared)
    }

}
