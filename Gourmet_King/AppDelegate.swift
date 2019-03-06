//
//  AppDelegate.swift
//  Gourmet_King
//
//  Created by Yoshiki Kishimoto on 2019/02/25.
//  Copyright © 2019 Yoshiki Kishimoto. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let cGooleMapsAPIKey = "AIzaSyDggbMZHbm6yBCiauMpTUTTmL7DSiYw8kw"


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey(cGooleMapsAPIKey)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
      
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
       
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }


}

