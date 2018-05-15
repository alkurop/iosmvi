//
//  AppDelegate.swift
//  demo
//
//  Created by Alexey Kuropiantnyk on 14/05/2018.
//  Copyright © 2018 Alexey Kuropiantnyk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        self.window?.backgroundColor = UIColor(ciColor: CIColor.white)
        let screenOne = ScreenOneVC(nibName: "ScreenOne", bundle: nil)
        let nav = UINavigationController(rootViewController: screenOne)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        return true
    }
}

