//
//  AppDelegate.swift
//  PlantLife
//
//  Created by Michael Baldock on 31/01/2019.
//  Copyright © 2019 Michael Baldock. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  /// Default initialiser for App Coordinator instantiates the dependencies.
  let app = AppCoordinator()
  
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = app
    window?.makeKeyAndVisible()
    
    return true
  }

}

