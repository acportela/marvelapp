//
//  CharacterDetailsViewControllerSpec.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 4/7/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MarvelHeroes

class CharacterDetailsViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        var sut: CharacterDetailsViewController!
        
        describe("CharacterDetailsViewController") {
            
            context("when presenting on screen") {
                
                beforeEach {
                    let helper = JsonHelper()
                    let data = helper.dataFromFile("CharactersResponse", andContext: type(of: self))
                    let response = helper.parse(dataType: APIResponse<MarvelCharacter>.self,
                                                    from: data)
                    sut = CharacterDetailsViewController(character: response.data.results[0])
                    sut.view.outlineRecursively(color: .red)
                    WindowTestHelper.show(controller: sut)
                }
                
                afterEach {
                    WindowTestHelper.clean()
                }
                
                it("must render properly") {
                    expect(sut).to(matchSnapshot(named: "CharacterDetailsViewController"))
                }
                
            }
            
            
        }
        
    }
    
}
