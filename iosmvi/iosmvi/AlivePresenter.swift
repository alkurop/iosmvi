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
    var resultPublisher: BehaviorSubject<ViewState> { get set }
    var disposableContainer: DisposableContainer { get set }
}

public extension AlivePresenter {
    func subscribe(intentions: Observable<Action>) -> Observable<ViewState> {
        if disposableContainer.disposable == nil {
            disposableContainer.disposable = intentions.compose(
                            interactor.provideProcessor()).scan(
                            self.defaultViewState,
                            accumulator: self.resultToViewStateMapper()
                    )
                    .subscribe(onNext: { state in
                        self.resultPublisher.onNext(state)
                    })

        }
        return resultPublisher
    }

    func dispose() {
        disposableContainer.disposable?.dispose()
        disposableContainer.disposable = nil
    }
}

public class DisposableContainer {
    var disposable: Disposable? = nil

    public init(){}
}

