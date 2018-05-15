//
//  ViewController.swift
//  demo
//
//  Created by Alexey Kuropiantnyk on 14/05/2018.
//  Copyright © 2018 Alexey Kuropiantnyk. All rights reserved.
//

import UIKit
import iosmvi

class ScreenOneVC: MviViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goToScreenTwo(_ sender: Any) {
        let screenTwo = ScreenTwoVC(nibName: "ScreenTwo", bundle: nil, requestId: 25)
        self.navigationController?.pushViewController(screenTwo, animated: true)
    }
    
    override func didReceiveVcResult(resultId: Int, result: [String : Any]) {
        if (resultId == 25) {
            print(result)
        }
    }
}
