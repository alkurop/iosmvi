//
//  MviViewController.swift
//  iosmvi
//
//  Created by Oleksii.Kuropiatnyk on 26/04/2018.
//  Copyright © 2018 Oleksii.Kuropiatnyk. All rights reserved.
//

import Foundation
import UIKit

open class MviViewController : UIViewController {
    public var dismissCallback: (([String:Any]) -> ())? = nil
    public var args: [String:Any] = [:]
    
    open class func getNibName() -> String {
        return String(describing: self)
    }
}
