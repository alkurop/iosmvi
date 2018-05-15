//
//  ObservableType+Compose.swift
//  MyStreetPlaces
//
//  Created by Oleksii.Kuropiatnyk on 12/04/2018.
//  Copyright © 2018 Катяя Куропятник. All rights reserved.
//

import Foundation
import RxSwift

public struct ComposeTransformer<T, R> {
    let transformer: (Observable<T>) -> Observable<R>
    public init(transformer: @escaping (Observable<T>) -> Observable<R>) {
        self.transformer = transformer
    }
    
    public func call(_ observable: Observable<T>) -> Observable<R> {
        return transformer(observable)
    }
}

public extension ObservableType {
    public func compose<T>(_ transformer: ComposeTransformer<E, T>) -> Observable<T> {
        return transformer.call(self.asObservable())
    }
}
