//
//  CharacterTableViewCellSpec.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 3/30/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MarvelHeroes

class CharacterTableViewCellSpec: QuickSpec {
    
    override func spec() {
        
        var sut: CharacterTableViewCell!
        
        describe("CharacterTableViewCell") {
            
            context("when presenting on screen") {
                
                context("with a favorite state") {
                    
                    beforeEach {
                        initCellWithFavoriteState(true)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "CharacterTableViewCell_Favorite"))
                    }
                    
                }
                
                context("with a non favorite state") {
                    
                    beforeEach {
                        initCellWithFavoriteState(false)
                    }
                    
                    it("must render properly") {
                        expect(sut).to(matchSnapshot(named: "CharacterTableViewCell"))
                    }
                    
                }
                
            }
            
            func initCellWithFavoriteState(_ favorite: Bool) {
                
                let frame = CGRect(x: 0, y: 0, width: 320, height: 96)
                
                let character = MarvelCharacter(id: 123456, name: "3-D Man", thumbnail: Thumbnail())
                
                let config = CharacterTableViewCell.Configuration(character: character, isFavorite: favorite)
                
                sut = CharacterTableViewCell(frame: frame)
                sut.setup(with: config)
                sut.outlineRecursively(color: .red)
            }
            
        }
        
    }
    
}
