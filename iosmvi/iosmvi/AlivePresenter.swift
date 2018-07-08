//
//  Presenter.swift
//  MyStreetPlaces
//
//  Created by Oleksii.Kuropiatnyk on 11/04/2018.
//  Copyright © 2018 Катяя Куропятник. All rights reserved.
//

import Foundation
import RxSwift

public protocol AlivePresenter: Presenter {

    var interactor: Interactor1 { get set }
    var compositeDisposable: CompositeDisposable { get set }
    var resultPublisher: BehaviorSubject<ViewState> { get set }
}

public extension AlivePresenter {
    init(interactor: Interactor1) {
        self.init(interactor: interactor)
        self.interactor = interactor
        self.compositeDisposable = CompositeDisposable()
        resultPublisher = BehaviorSubject(value: self.defaultViewState())
        let dis = intentions.compose(
                        interactor.provideProcessor()).scan(
                        self.defaultViewState(),
                        accumulator: self.resultToViewStateMapper()
                )
                .subscribe(onNext: { state in
                    self.resultPublisher.onNext(state)
                })
        compositeDisposable.insert(dis)
    }

    func subscribe(intentions: Observable<Action>) -> Observable<ViewState> {
        return resultPublisher
    }

    func dispose() {
        compositeDisposable.dispose()
    }
}

