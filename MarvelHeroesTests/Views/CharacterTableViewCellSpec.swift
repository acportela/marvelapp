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
                
                let path = ImagePath(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", fileExtension: "jpg")
                
                let description = """
                Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate!
                Transformed by a Gamma energy explosion
                """
                
                let config = CharacterTableViewCell.Configuration(name: "3-D Man",
                                                                  about: description,
                                                                  isFavorite: favorite,
                                                                  image: path)
                
                sut = CharacterTableViewCell(frame: frame)
                sut.setup(with: config)
                sut.outlineRecursively(color: .red)
            }
            
        }
        
    }
    
}
