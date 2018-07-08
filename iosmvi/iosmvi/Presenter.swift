//
//  Presenter.swift
//  MyStreetPlaces
//
//  Created by Oleksii.Kuropiatnyk on 11/04/2018.
//  Copyright © 2018 Катяя Куропятник. All rights reserved.
//

import Foundation
import RxSwift

public protocol Presenter {
    associatedtype Action
    associatedtype Result
    associatedtype ViewState
    associatedtype Interactor1 : Interactor where Interactor1.Action == Action, Interactor1.Result == Result
    
    func resultToViewStateMapper() ->  (ViewState, Result) -> (ViewState)
    func subscribe(intentions: Observable<Action>) -> Observable<ViewState>
    func defaultViewState() -> ViewState
    
    var interactor : Interactor1 { get set }
}

public extension Presenter {
    func subscribe(intentions: Observable<Action>) -> Observable<ViewState> {
        return intentions.compose(
            interactor.provideProcessor()).scan(self.defaultViewState(),
            accumulator: self.resultToViewStateMapper()
        )
    }
}

