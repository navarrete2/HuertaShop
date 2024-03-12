//
//  HuertaShopApp.swift
//  HuertaShop
//
//  Created by Miguel  on 10/3/24.
//

import SwiftUI
import Firebase
import FirebaseAppCheck

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Configura Firebase
        FirebaseApp.configure()
        
        // Configura Firebase App Check
        if #available(iOS 13.0, *) {
            AppCheck.setAppCheckProviderFactory(DeviceCheckProviderFactory())
        }
        
        return true
    }
}

@main
struct MyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
