//
//  AppDelegate.swift
//  TaskNumberOfCards
//
//  Created by Ivan Simunovic on 10/10/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let firstScene = MainSceneViewController()
        firstScene.title = "Number of decks of cards game"
        
        let navigationController = UINavigationController(rootViewController: firstScene)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
        navigationController.navigationBar.titleTextAttributes = textAttributes
                
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

