//
//  AppDelegate.swift
//  MirianMAglakelidze#24
//
//  Created by Admin on 8/23/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let notification = UNUserNotificationCenter.current()
        notification.delegate = self
        
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

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let reminder = ReminderForm(title: response.notification.request.content.title, body: response.notification.request.content.body, date: Date())
        coordinateToSomeVC(reminderId: reminder)
    }
    
    private func coordinateToSomeVC(reminderId: ReminderForm) {
        guard let window = (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "ViewController") as? ReminderDetailsViewController else { return }
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        vc.reminder = reminderId
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
}

