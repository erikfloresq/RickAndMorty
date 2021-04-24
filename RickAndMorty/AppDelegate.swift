//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        guard userActivity?.activityType == NSUserActivityTypeBrowsingWeb,
              let url = userActivity?.webpageURL,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return false
        }

        // 2
        if components.path == "buy" {

          return true
        }

        if components.path == "help" {
            return true
        }

        // 3
        if let webpageUrl = URL(string: "http://try-webpage.herokuapp.com") {
          application.open(webpageUrl)
          return false
        }

        return false
    }

}

