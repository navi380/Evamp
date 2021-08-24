//
//  InjectApiProtocolImplementation.swift
//  EvampProject
//
//  Created by Naveed Tahir on 24/08/2021.
//

import Foundation

class Injection{
    static let provide = Injection()


    func ApiProtocolInjection() -> LoginViewModel{
        return LoginViewModel(protocolArgument: ApiProtocolImplementationService.shared)
    }
    

}
