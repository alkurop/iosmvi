//
//  Navigator.swift
//  MyStreetPlaces
//
//  Created by Oleksii.Kuropiatnyk on 12/04/2018.
//  Copyright © 2018 Катяя Куропятник. All rights reserved.
//

import Foundation
import DITranquillity
import UIKit

open class MviViewController : UIViewController {
    var dismissCallback: (([String:Any]) -> ())? = nil
    var args: [String:Any]? = nil
    
    open class func getNibName() -> String {
        return String(describing: self)
    }
}

public class Navigator  {
    weak var viewController : MviViewController?
    public init(viewController: MviViewController) {
        self.viewController = viewController
    }
    
    public func navigate(event : NavigatorEvent) {
        DispatchQueue.main.sync {
            switch event {
            case let .PresentVC (viewController):
                self.viewController?.navigationController?.pushViewController(viewController, animated: true)
            case let .DismissSelf (result):
                self.viewController?.navigationController?.popViewController(animated: true)
                if result != nil {
                    self.viewController?.dismissCallback?(result!)
                }
                self.viewController?.dismissCallback = nil
            }
        }
    }
}

public extension DIContainer {
    func registerNavigator(navigator: Navigator, key: String) {
        self.register { navigator }
            .as(Navigator.self, name: key)
            .lifetime(.perRun(.weak))
    }
}

public enum NavigatorEvent {
    case PresentVC (viewController: MviViewController)
    case DismissSelf (result: [String:Any]?)
}


