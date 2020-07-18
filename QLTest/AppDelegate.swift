//
//  AppDelegate.swift
//  QLTest
//
//  Created by Zin Min on 17/07/2020.
//  Copyright © 2020 Zin Min Phyo. All rights reserved.
//

import UIKit
import Apollo

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Network.shared.apollo.fetch(query: HeroQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            let data = graphQLResult.data
            let json = data?.jsonObject
            print("JSON Object is \(json)")
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

