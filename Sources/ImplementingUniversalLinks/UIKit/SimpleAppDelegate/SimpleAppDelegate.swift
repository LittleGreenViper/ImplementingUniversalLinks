/*
 © Copyright 2024, Little Green Viper Software Development LLC
 LICENSE:
 
 MIT License
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
 modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
 CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit

/* ###################################################################################################################################### */
// MARK: - App Delegate -
/* ###################################################################################################################################### */
/**
 This is a simple "old-fashioned" UIKit app delegate class.
 */
@main
class AppDelegate: UIResponder {
    /* ################################################################## */
    /**
     This is the required window property of the app delegate.
     */
    var window: UIWindow?
}

/* ###################################################################################################################################### */
// MARK: Computed Properties
/* ###################################################################################################################################### */
extension AppDelegate {
    /* ################################################################## */
    /**
     This is the current view controller.
     */
    var currentViewController: ViewController? {
        window?.rootViewController as? ViewController
    }
}

/* ###################################################################################################################################### */
// MARK: UIApplicationDelegate Conformance
/* ###################################################################################################################################### */
extension AppDelegate: UIApplicationDelegate {
    /* ################################################################## */
    /**
     Called when the app has completed its launch cycle.
     
     - parameter: The application instance (ignored).
     - parameter didFinishLaunchingWithOptions: The options provided with the launch. We ignore this, as well.
     - returns: True (always).
     */
    func application(_: UIApplication, didFinishLaunchingWithOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { true }
    
    /* ################################################################## */
    /**
     Called when the app has been opened from a URL. This applies both for "cold start," and foregrounding.
     
     - parameter: The application instance (ignored).
     - parameter open: The URL that was sent to the app.
     - parameter options: The options provided with the launch. We ignore this, as well.
     - returns: True (always).
     */
    func application(_: UIApplication, open inURL: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        var status: AppStatus = .off
        
        if let statusString = inURL.query(),    // Parse out the entire query string. Our implementation requires nothing else.
           let tempStatus = AppStatus(rawValue: statusString) { // Create an instance of AppStatus, based on the query string.
            status = tempStatus
        }
        
        currentViewController?.updateUI(status: status) // Force an update of the current screen.
        
        return true
    }
}
