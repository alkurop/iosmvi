//
//  OneShot.swift
//  MyStreetPlaces
//
//  Created by Oleksii.Kuropiatnyk on 28/04/2018.
//  Copyright © 2018 Катяя Куропятник. All rights reserved.
//

import Foundation

public class OneShot {
    private var shouldExecute = true
    public let params: Any
    
    public init(_ params: Any? = nil){
        self.params = params
    }

    public func isActive() -> Bool {
        let localShould = shouldExecute
        shouldExecute = false
        return localShould
    }
}
