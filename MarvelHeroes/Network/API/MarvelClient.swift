//
//  MarvelClient.swift
//  MarvelHeroes
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import Alamofire
import Keys
import CryptoSwift

class MarvelClient: SessionManager {
    
    private init() {
        super.init()
    }
    
    static let sharedClient = MarvelClient()
    
    func requestDecodadle<T: Decodable>(url: URL, callback: @escaping (Result<T>) -> Void) {
        self.request(url: url) { resp in
            switch resp {
            case .success(let data):
                
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    callback(.success(object))
                } catch {
                    callback(.error(.parsing))
                }
                
            case .error(let error):
                callback(.error(error))
            }
        }
    }
    
    private func request(url: URL, callback: @escaping (Result<Data>) -> Void) {
        
        let request = URLRequest(url: url)
        
        guard let rechability = NetworkReachabilityManager(), rechability.isReachable else {
            callback(.error(.connectivity))
            return
        }
        
        self.request(request).validate(statusCode: 200..<300).responseData { dataResponse in
            
            guard dataResponse.result.error == nil else {
                callback(.error(.authentication))
                return
            }
            
            guard let data = dataResponse.data else {
                callback(.error(.unknown))
                return
            }
            
            callback(.success(data))
            
        }
    }
}

extension MarvelClient {
    enum Configuration {
        
        static let baseURL = "https://gateway.marvel.com:443/v1/"
        
        private static let keys = MarvelHeroesKeys()
        private static let privatekey = keys.marvelPrivateKey
        private static let publicKey = keys.marvelPublicKey
        
        static var defaultQueries: [String: String] {
            
            let stamp = Date().timeIntervalSince1970.description
            let hash = "\(stamp)\(privatekey)\(publicKey)".md5()
            
            return ["apikey": publicKey,
                    "ts": stamp,
                    "hash": hash]
            
        }
    }
}
