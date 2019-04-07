//
//  CharacterMaterialHeaderViewSpec.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 4/6/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MarvelHeroes

class CharacterMaterialHeaderViewSpec: QuickSpec {
    
    override func spec() {
        
        var sut: CharacterMaterialHeaderView!
        
        describe("CharacterMaterialHeaderView") {
            
            context("when presenting on screen") {
                
                beforeEach {
                    let frame = CGRect(x: 0, y: 0, width: 320, height: 30)
                    let config = CharacterMaterialHeaderView.Configuration(name: "Comics")
                    sut = CharacterMaterialHeaderView(frame: frame)
                    sut.setup(with: config)
                    sut.outlineRecursively(color: .red)
                }
                
                it("must render properly") {
                    expect(sut).to(matchSnapshot(named: "CharacterMaterialHeaderView"))
                }
                
            }
            
            
        }
        
    }
    
}
