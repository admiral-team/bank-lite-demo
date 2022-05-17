//
//  LocalNotificationService.swift
//  BankLiteDemo
//
//  Created by Алмазов Иван Александрович on 28.03.2022.
//

import UserNotifications

class LocalNotificationService {
    
    func sendNotifications() {
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Успешно!"
        content.body = "Ваша карта выпущена"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        notificationCenter.add(request)
    }

}
