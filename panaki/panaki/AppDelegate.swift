//
//  AppDelegate.swift
//  panaki
//
//  Created by Kazuma from IRASER on 2015/11/05.
//  Copyright © 2015年 Kazuma. All rights reserved.
//

import UIKit
import AVFoundation
import JSQMessagesViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        let panaki = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("panaki", ofType: "aiff")!)
        var sound: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(panaki, &sound)
        AudioServicesPlaySystemSound(sound)
        return true
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        NSThread.sleepForTimeInterval(1.0)
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
       // let viewController = Andrea_higa_score()
       // Andrea_higa_score.login()
        let mainviewController = ViewController()
        self.window!.rootViewController = mainviewController
        self.window!.makeKeyAndVisible()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.153, green: 0.682, blue: 0.376, alpha: 1)
        UINavigationBar.appearance().setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

