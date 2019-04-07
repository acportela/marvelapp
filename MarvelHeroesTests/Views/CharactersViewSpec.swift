//
//  CharactersViewSpec.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MarvelHeroes

class CharactersViewSpec: QuickSpec {
    
    override func spec() {
        
        var sut: CharactersView!
        
        describe("CharactersView") {
            
            context("when presenting on screen") {
                
                beforeEach {
                    let frame = CGRect(x: 0, y: 0, width: 375, height: 667)
                    sut = CharactersView(frame: frame)
                }
                
                it("must render properly") {
                    expect(sut).to(matchSnapshot(named: "CharactersView"))
                }
                
            }
            
            
        }
        
    }
    
}
