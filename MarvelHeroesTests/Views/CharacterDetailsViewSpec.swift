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
                    
                    let path = ImagePath(path: "", fileExtension: "")
                    let config = CharacterDetailsView.Configuration(name: "3-D Man", image: path)
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
