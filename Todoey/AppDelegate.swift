//
//  AppDelegate.swift
//  Todoey
//
//  Created by mac on 12/1/2562 BE.
//  Copyright © 2562 nuttaweeO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // ฟังชั่นนี้จะโหลดเมื่อแอปถูกเรียกใช้ ก่อนหน้าที่ viewcontoller หรืออะไรจะถูกโหลด โดยไม่สนว่าสุดท้าย แอปจะ crash หรือไม่
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // ฟังชั่นนี้จะรันเมื่อ แอปถูกแทรก เช่น มีคนโทรเข้ามา ระหว่างที่ แอป กำลังใช้งานอยู่
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // ฟังชั่นนี้จะถูกใช้เมื่อ กดปุ่ม home
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // ฟังชัน่นี้จะถูกเรียกใช้เมื่อ แอป ยุติการทำงาน
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

