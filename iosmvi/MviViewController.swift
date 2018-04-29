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
    var dismissCallback: (([String:Any]) -> ())? = nil
    var args: [String:Any] = [:]
    
    open class func getNibName() -> String {
        return String(describing: self)
    }
}
