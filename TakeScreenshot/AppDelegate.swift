//
//  AppDelegate.swift
//  TakeScreenshot
//
//  Created by Angelos Staboulis on 21/8/23.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var viewController:ViewController!
    var nsImage:NSImage!
   
    @IBAction func showScreenShot(_ sender: Any) {
        nsImage=Helper.shared.showImage(viewController: viewController)
    }
    
    @IBAction func saveScreenShot(_ sender: Any) {
        Helper.shared.saveScreenShot(nsImage: nsImage)
    }
    
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        viewController =  (NSApplication.shared.orderedWindows.first?.contentViewController as? ViewController)!

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

