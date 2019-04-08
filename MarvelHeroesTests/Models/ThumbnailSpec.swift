//
//  ThumbnailSpec.swift
//  MarvelHeroesTests
//
//  Created by Antonio Rodrigues on 4/7/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MarvelHeroes

class ThumbnailSpec: QuickSpec {
    
    override func spec() {
        
        describe("Thumbnail") {
            
            let thumbImage = Thumbnail(path: "test", pathExtension: "png")
            
            it("should have correct full path") {
                expect(thumbImage.fullPath).to(equal("test.png"))
            }
            
        }
        
    }
    
}
