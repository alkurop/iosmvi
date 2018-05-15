//
//  Navigator.swift
//  MyStreetPlaces
//
//  Created by Oleksii.Kuropiatnyk on 12/04/2018.
//  Copyright © 2018 Катяя Куропятник. All rights reserved.
//

import Foundation
import RxSwift

public class Navigator  {
    private static let RESULT_DELAY_SECONDS = 0.5
    public weak var parent : MviViewController?
    public init(viewController: MviViewController) {
        self.parent = viewController
    }
    
    public func navigate(event : NavigatorEvent, animated: Bool = true) {
        DispatchQueue.main.sync { [unowned self] in
            switch event {
            case let .PresentVC (viewController):
                self.parent?.navigationController?.pushViewController(viewController, animated: animated)
            case let .Pop (result):
                self.parent?.navigationController?.popViewController(animated: animated)
                if let requestId = self.parent?.requestId {
                    if let res  = result {
                        let vcResult = VCResult(requestId: requestId, result: res)
                        self.returnResult(result: vcResult)
                    }
                }
            case let .Dismiss (result):
                self.parent?.dismiss(animated: animated, completion: {
                    if let requestId = self.parent?.requestId {
                        if let res  = result {
                           let vcResult = VCResult(requestId: requestId, result: res)
                            self.returnResult(result: vcResult)
                        }
                    }
                })
            }
        }
    }
    
    func returnResult(result: VCResult){
        let _ = Observable.just(0)
            .delay(Navigator.RESULT_DELAY_SECONDS, scheduler: MainScheduler.asyncInstance)
            .flatMap {_ in
                Completable.create{sub in
                    resultBus.onNext(result)
                    sub(.completed)
                    return Disposables.create()
                }
                
            }
            .subscribe()
    }
}

public enum NavigatorEvent {
    case PresentVC (viewController: MviViewController)
    case Pop (result: [String:Any]? )
    case Dismiss (result: [String:Any]?)
}


