//
//  Navigator.swift
//  MyStreetPlaces
//
//  Created by Oleksii.Kuropiatnyk on 12/04/2018.
//  Copyright © 2018 Катяя Куропятник. All rights reserved.
//

import Foundation

public class Navigator  {
    weak var viewController : MviViewController?
    public init(viewController: MviViewController) {
        self.viewController = viewController
    }
    
    public func navigate(event : NavigatorEvent, animated: Bool = true) {
        DispatchQueue.main.sync {
            switch event {
            case let .PresentVC (viewController):
                self.viewController?.navigationController?.pushViewController(viewController, animated: animated)
            case let .DismissSelf (result):
                self.viewController?.navigationController?.popViewController(animated: animated)
                if result != nil {
                    self.viewController?.dismissCallback?(result!)
                }
                self.viewController?.dismissCallback = nil
            }
        }
    }
}

public enum NavigatorEvent {
    case PresentVC (viewController: MviViewController)
    case DismissSelf (result: [String:Any]?)
}


