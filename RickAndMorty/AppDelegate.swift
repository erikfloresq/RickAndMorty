//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appState = AppState()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainView = MainView().environmentObject(appState)
        let initViewController = UIHostingController(rootView: mainView)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initViewController
        window?.makeKeyAndVisible()
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let url = userActivity.webpageURL,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return false
        }

        if components.path == "/characters" {
            appState.tabSelected = .characters
            return true
        }

        if components.path == "/locations" {
            appState.tabSelected = .locations
            return true
        }

        // 3
        if let webpageUrl = URL(string: "https://rick-and-morty-demo.herokuapp.com") {
          application.open(webpageUrl)
          return false
        }

        return false
    }

}

