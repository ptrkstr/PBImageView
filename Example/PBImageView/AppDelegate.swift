//
//  AppDelegate.swift
//  PBImageView
//
//  Created by patrickbdev on 09/29/2016.
//  Copyright (c) 2016 patrickbdev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        window.backgroundColor = .white
        self.window = window
        return true
    }
}
