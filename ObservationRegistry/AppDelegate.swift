//
//  AppDelegate.swift
//  ObservationRegistry
//
//  Created by Uladzislau Kachan on 5/2/20.
//  Copyright © 2020 Uladzislau Kachan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    enum Events: Convertible {
        case willEnterForeground
        case didEnterBackground
    }
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let router = RootRouter()
        self.window  = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = router.initialViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        self.notify(event: .willEnterForeground)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        self.notify(event: .didEnterBackground)
    }
}

extension AppDelegate: Observable {
    typealias `Event` = Events
}
