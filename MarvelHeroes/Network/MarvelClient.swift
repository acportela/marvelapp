//
//  MarvelClient.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import Alamofire

class MarvelClient: SessionManager {
    
    private init() {
        super.init()
    }
    
    static let sharedClient = MarvelClient()
    
    func requestDecodadle<T: Decodable>(request: URLRequest, callback: @escaping (Result<T>) -> Void) {
        
        self.request(request: request) { resp in
            
            switch resp {
            case .success(let data):
                
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    callback(.success(object))
                } catch {
                    callback(.error(Errors.parsing))
                }
                
            case .error(let error):
                callback(.error(error))
            }
            
        }
        
    }
    
    private func request(request: URLRequest, callback: @escaping (Result<Data>) -> Void) {
        
        guard let rechability = NetworkReachabilityManager(), rechability.isReachable else {
            callback(.error(Errors.connectivity))
            return
        }
        
        self.request(request).validate(statusCode: 200..<300).responseData { dataResponse in
            
            guard dataResponse.result.error == nil else {
                callback(.error(Errors.connectivity))
                return
            }
            
            guard let data = dataResponse.data else {
                callback(.error(Errors.connectivity))
                return
            }
            
            callback(.success(data))
            
        }
        
    }
    
}
