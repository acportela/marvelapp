//
//  CharacterDetailsViewSpec.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MarvelHeroes

class CharacterDetailsViewSpec: QuickSpec {
    
    override func spec() {
        
        var sut: CharacterDetailsView!
        
        describe("CharacterDetailsView") {
            
            context("when presenting on screen") {
                
                beforeEach {
                    
                    let frame = CGRect(x: 0, y: 0, width: 375, height: 667)
                    sut = CharacterDetailsView(frame: frame)
                    
                    let character = MarvelCharacter(id: 123456, name: "3-D Man", thumbnail: Thumbnail())
                    let config = CharacterDetailsView.Configuration(character: character, isFavorite: false)
                    
                    sut.setup(with: config)
                    sut.outlineRecursively(color: .red)
                    
                }
                
                it("must render properly") {
                    expect(sut).to(matchSnapshot(named: "CharacterDetailsView"))
                }
                
            }
            
        }
        
    }
    
}
