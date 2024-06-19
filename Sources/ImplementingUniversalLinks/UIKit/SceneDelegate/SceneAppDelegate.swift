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
// MARK: - Scene App Delegate -
/* ###################################################################################################################################### */
/**
 This is the app delegate for a more "current" scene-based UIKit app.
 
 We also make this the scene delegate, to reduce the amount of code we need.
 */
@main
class AppDelegate: UIResponder {
    /* ################################################################## */
    /**
     This is the window property that tracks the current scene.
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
        window?.windowScene?.windows.last?.rootViewController as? ViewController
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
     This is pretty much a "default" scene config. It simply returns the default scene config, with no extras.
     
     - parameter: The application instance (ignored).
     - parameter configurationForConnecting: The session that needs a configuration.
     - parameter options: The options provided with the connection. We ignore this, as well.
     - returns: The default configuration for the session's role.
     */
    func application(_: UIApplication, configurationForConnecting inSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: inSession.role)
    }
}

/* ###################################################################################################################################### */
// MARK: UIWindowSceneDelegate Conformance
/* ###################################################################################################################################### */
extension AppDelegate: UIWindowSceneDelegate {
}
