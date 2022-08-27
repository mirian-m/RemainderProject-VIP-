//
//  NotificatinManegerWoker.swift
//  MirianMAglakelidze#24
//
//  Created by Admin on 8/27/22.
//

import Foundation
import UIKit
import UserNotifications

class NotificationWoker {
    
    func addNotification(notification: ReminderForm, duration: Int, repeats: Bool, userInfo: [AnyHashable : Any]) {
        
        
        let content = UNMutableNotificationContent()
        content.title = notification.title
        content.body = notification.body
        content.sound = UNNotificationSound.default
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        content.userInfo = userInfo
        let targetDate = notification.date
        
        // Trigger push notification in seted time
//        let trigger = UNCalendarNotificationTrigger(
//            dateMatching: Calendar.current.dateComponents([.year, .month,. day, .hour, .minute], from: targetDate),
//            repeats: repeats)
        
        // Using this trigger to push notification after 5 seconds
         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(5), repeats: repeats)

        let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().add(request) { error in
            guard error == nil else { return }
        }
    }
}
