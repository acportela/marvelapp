//
//  MarvelServiceSpec.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 4/7/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import MarvelHeroes

class MarvelServiceSpec: QuickSpec {
    
    override func spec() {
        
        var sut: MarvelService!
        var characters: APIResponse<MarvelCharacter>? = nil
        var material: APIResponse<CharacterMaterial>? = nil
        
        describe("MarvelService") {
            
            afterEach {
                sut = nil
                characters = nil
                material = nil
            }
            
            context("when fetching characters") {
                
                beforeEach {
                    sut = MarvelService(client: APIClientMock())
                    sut.fetchCharacters() { result in
                        switch result {
                        case .success(let response):
                            characters = response
                        case .error:
                            break
                        }
                    }
                }
                
                it("must return a valid response") {
                    expect(characters).toNot(beNil())
                }
                
            }
            
            context("when fetching a character material") {
                
                beforeEach {
                    sut = MarvelService(client: APIClientMock())
                    sut.fetchMaterial(ofKind: .comics(123456)) { result in
                        switch result {
                        case .success(let response):
                            material = response
                        case .error:
                            break
                        }
                    }
                }
                
                it("must return a valid response") {
                    expect(material).toNot(beNil())
                }
                
            }
            
        }
        
    }
    
}
