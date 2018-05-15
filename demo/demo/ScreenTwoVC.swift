//
//  ScreenTwoVC.swift
//  demo
//
//  Created by Alexey Kuropiantnyk on 14/05/2018.
//  Copyright © 2018 Alexey Kuropiantnyk. All rights reserved.
//

import Foundation
import UIKit
import iosmvi
import RxSwift

class ScreenTwoVC: MviViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIBarButtonItem (barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(action))
        
        self.navigationItem.leftBarButtonItem = btn
    }
    
    @objc func action(){
        let result: [String: Any] = ["privet" : "privet"]
        self.navigationController?.popViewController(animated: true)
            if let requestId = self.requestId {
                Observable.just(0)
                .delay(0.5, scheduler: MainScheduler.asyncInstance)
                    .flatMap {_ in
                        Completable.create{sub in
                            resultBus.onNext(VCResult(requestId: requestId, result: result))
                            sub(.completed)
                            return Disposables.create()
                        }

                    }
                
                .subscribe()
            }
        
    }
    
    @IBAction func dismiss(_ sender: Any) {
        action()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
