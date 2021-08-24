//
//  ApiProtocolImplementation.swift
//  EvampProject
//
//  Created by Naveed Tahir on 23/08/2021.
//

import Foundation

//I am not using clean code and generics for now because i just need to call 2 api's it will increase complexity

class ApiProtocolImplementationService: ApiProtocol{
    private init(){}
    static let shared = ApiProtocolImplementationService()
    
    func loginUser(login: LoginModel, completionHandler: @escaping (Result<[LoginResponseModel]>) -> ()) {
        var urlRequest = URLRequest(url: loginUrl!)
        urlRequest.httpMethod = "POST"
        do {
            let requestBody = try JSONEncoder().encode(login)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch let error {
            print(error.localizedDescription)
        }
        let task = URLSession.shared.dataTask(with: loginUrl!) { data, response, error in
            if error != nil || data == nil {
                    print("Client error!")
                    return
                }
            //checking if the reponse is valid
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
            guard let mime = response.mimeType, mime == "application/json" else {
                   print("Wrong MIME type!")
                   return
               }
            //do catch is more like if else here do is storing data in a variable and catch is checking errors
            do {
                let json = JSONDecoder()
                let postData = try json.decode([LoginResponseModel].self, from: data!)
                completionHandler(Result.success(postData))
               } catch {
                   print("JSON error: \(error.localizedDescription)")
               }
        }
        task.resume()
        }
    }

