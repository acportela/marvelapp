//
//  CharacterMaterialCellSpec.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 4/6/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MarvelHeroes

class CharacterMaterialCellSpec: QuickSpec {
    
    override func spec() {
        
        var sut: CharacterMaterialCell!
        
        describe("CharacterMaterialCell") {
            
            context("when presenting on screen") {
                
                beforeEach {
                    let frame = CGRect(x: 0, y: 0, width: 320, height: 96)
                    let description = """
                    The frighteningly funky and fearsome Freak returns more
                    powerful than ever! And this action-packed issue features
                    The frighteningly funky and fearsome Freak returns more
                    powerful than ever! And this action-packed issue features
                    """

                    let config = CharacterMaterialCell.Configuration(name: "Spider-Man",
                                                                     description: description)
                    sut = CharacterMaterialCell(frame: frame)
                    sut.setup(with: config)
                    sut.outlineRecursively(color: .red)
                }
                
                it("must render properly") {
                    
                    expect(sut).to(matchSnapshot(named: "CharacterMaterialCell"))
                    
                }
                
            }
            
            
        }
        
    }
    
}
