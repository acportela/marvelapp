//
//  APIClientMock.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 4/7/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
@testable import MarvelHeroes

class APIClientMock: APIClient {
    
    func requestDecodadle<T: Decodable>(url: URL, callback: @escaping (Result<T>) -> Void) {
        let response = MockHelper().responseFor(decodableType: T.self)
        callback(.success(response))
    }

}
