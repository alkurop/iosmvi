//
//  MviViewController.swift
//  iosmvi
//
//  Created by Oleksii.Kuropiatnyk on 26/04/2018.
//  Copyright © 2018 Oleksii.Kuropiatnyk. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

open class MviViewController : UIViewController {
    public var args: [String:Any] = [:]
    public let requestId: Int?
    private var resultBusDisposable: Disposable? = nil
    
    open class func getNibName() -> String {
        return String(describing: self)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
       resultBusDisposable = resultBus.observeOn(MainScheduler.instance)
            .subscribe(onNext :{ [unowned self] results in
                self.didReceiveVcResult(resultId: results.requestId, result: results.result)
            })
        super.viewWillAppear(animated)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        resultBusDisposable?.dispose()
        super.viewWillDisappear(animated)
    }
    
    open func didReceiveVcResult (resultId: Int, result: [String: Any]) {
        
    }
    
    public init (nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, requestId: Int? = nil){
        self.requestId = requestId
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.requestId = nil
        super.init(coder: aDecoder)
    }
    
}
