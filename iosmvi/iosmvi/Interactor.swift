//
//  Interactor.swift
//  MyStreetPlaces
//
//  Created by Oleksii.Kuropiatnyk on 11/04/2018.
//  Copyright © 2018 Катяя Куропятник. All rights reserved.
//

import Foundation

public protocol Interactor {
    associatedtype Action
    associatedtype Result
    
    func provideProcessor ()  -> ComposeTransformer<Action, Result>
}
