//
//  AppDelegate.swift
//  TechBook
//
//  Created by Riaz Hassan on 01/12/15.
//  Copyright © 2015 Riaz Hassan. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       
        self.cutomizeNavigationBarAppearence()
        self.startLocationManager()
        if ((GeneralUtitlity.getValueFromUserDefaults(LOGGEDIN_TAG)) != nil)
        {
            self.navigateToHomePage()
        }
        else
        {
            self.navigateToRegisterScreen()
        }
        
        print("Started Application")
        
        self.window?.makeKeyAndVisible()

        return true
    }
    
    func cutomizeNavigationBarAppearence()
    {
        
        //UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        UIApplication.sharedApplication().statusBarStyle = .Default
        let themeColor = UIColor(netHex:0x42454A)//UIColor(netHex:0x66CCFF)
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().barTintColor = themeColor
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        var font = UIFont()
        if #available(iOS 8.2, *) {
            font = UIFont.systemFontOfSize(18, weight: UIFontWeightHeavy)
        } else {
            font = UIFont.systemFontOfSize(18)
        }
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),  NSFontAttributeName : font]
    }
    
    func navigateToHomePage()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabVC :TBTabViewController = TBTabViewController()
        UITabBar.appearance().barTintColor = UIColor(netHex:0x42454A)//UIColor(netHex:0x66CCFF)
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        var font = UIFont()
        if #available(iOS 8.2, *) {
             font = UIFont.systemFontOfSize(15, weight: UIFontWeightThin)
        } else {
             font = UIFont.systemFontOfSize(15)
        }
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : font], forState: UIControlState.Normal)
        
        let tecVC :TechiesViewController = storyboard.instantiateViewControllerWithIdentifier("TechiesViewController") as! TechiesViewController
        let mapVC :MapViewController = storyboard.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
        let chatVC :ChatListViewController = storyboard.instantiateViewControllerWithIdentifier("ChatListViewController") as! ChatListViewController
        let profileVC :ProfileViewController = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
        
        let navController1 : UINavigationController = UINavigationController(rootViewController: tecVC)
        navController1.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "net"), tag: 0)
        navController1.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        
        let navController2 : UINavigationController = UINavigationController(rootViewController: mapVC)
        navController2.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "pin"), tag: 0)
        navController2.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        
        let navController3 : UINavigationController = UINavigationController(rootViewController: chatVC)
        navController3.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "comments"), tag: 0)
        navController3.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        navController3.tabBarItem.badgeValue = "9"
        
        let navController4 : UINavigationController = UINavigationController(rootViewController: profileVC)
        navController4.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "user"), tag: 0)
        navController4.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        
        tabVC.viewControllers = [navController1, navController2, navController3, navController4]
        
        
        self.window!.rootViewController = tabVC
        
    }
    func startLocationManager()
    {
        if(CLLocationManager.locationServicesEnabled()){
            
            if(CLLocationManager.authorizationStatus() ==   CLAuthorizationStatus.Denied){
                
               //Denied permision
            }
        }

    }
    
    func navigateToRegisterScreen()
    {
        let navController : UINavigationController = UINavigationController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewContr :ViewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        navController.viewControllers = [viewContr]
        self.window!.rootViewController = navController
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.TechBook.TechBook" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("TechBook", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()

    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason

            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

