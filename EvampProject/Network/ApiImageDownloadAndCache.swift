//
//  ApiImageDownloadAndCache.swift
//  EvampProject
//
//  Created by Naveed Tahir on 25/08/2021.
//

import Foundation


class ImageCache{
    private init(){}
    public static let shared = ImageCache()

    private var images = NSCache<NSString, NSData>()
    
    private func download(imageURL: URL, completion: @escaping (Data?, Error?) -> (Void)) {
    if let imageData = self.images.object(forKey: imageURL.absoluteString as NSString) {
        print("using cached images")
        completion(imageData as Data, nil)
        return
        }
        
        
     let session = URLSession(configuration: URLSessionConfiguration.default)
      let task = session.downloadTask(with: imageURL) { localUrl, response, error in
        if let error = error {
          completion(nil, error)
          return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
          print("Server Error")
          return
        }
        
        guard let localUrl = localUrl else {
          print("Bad Url")
          return
        }
        
        do {
          let data = try Data(contentsOf: localUrl)
          self.images.setObject(data as NSData, forKey: imageURL.absoluteString as NSString)
          completion(data, nil)
        } catch let error {
          completion(nil, error)
        }
      }
      
      task.resume()
    }
    
    func image(url: URL, completion: @escaping (Data?, Error?) -> (Void)) {
      download(imageURL: url, completion: completion)
    }
}
