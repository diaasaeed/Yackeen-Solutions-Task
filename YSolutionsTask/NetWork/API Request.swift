//
//  API Request.swift
//  YSolutionsTask
//
//  Created by Diaa saeed on 12/25/21.
//

import Foundation
class API: NSObject {

static let sharedInstance = API()

    func getRequest<T: Decodable>(url: String , onCompletion: @escaping (T?,Int, Error?)->()) {


        var request = URLRequest(url:URL(string:url)!)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type") // header
        request.httpMethod = "GET"
        print("shared URL : \(request)")


        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let statusCode =  response as? HTTPURLResponse

            if let error = error {
                onCompletion(nil, statusCode?.statusCode ?? 0, error)
                
            } else {
                guard let data = data else {  return  }

                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode == 200 {
                    do {
                        let jsonData = try JSONDecoder().decode(T.self, from: data)
                        onCompletion(jsonData, statusCode?.statusCode ?? 0, nil)

                    } catch let error as NSError {
                       onCompletion(nil, statusCode?.statusCode ?? 0, error)
                    }
                } else {
                    onCompletion(nil, statusCode?.statusCode ?? 0, error)
                }
            }
        }
        task.resume()
    }


    private override init() {}
}
