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
// MARK: - Main View Controller -
/* ###################################################################################################################################### */
/**
 This is the standard view controller for the two UIKit targets.
 
 It's very simple: Just a label, indicating which target it is, and three "traffic light" images, under that.
 */
class ViewController: UIViewController {
    /* ################################################################## */
    /**
     The red "traffic light."
     */
    @IBOutlet var stopLight: UIImageView!
    
    /* ################################################################## */
    /**
     The yellow "traffic light."
     */
    @IBOutlet var cautionLight: UIImageView!
    
    /* ################################################################## */
    /**
     The green "traffic light."
     */
    @IBOutlet var goLight: UIImageView!
    
    /* ################################################################## */
    /**
     This is the state of the app, as defined by the URL. Default is off.
     We keep this around, because the Scene Delegate will set the status before we appear.
     */
    var status: AppStatus = .off
}

/* ###################################################################################################################################### */
// MARK: Base Class Overrides
/* ###################################################################################################################################### */
extension ViewController {
    /* ################################################################## */
    /**
     This makes sure the "traffic lights" are in the correct state, by the time the screen is shown.
     */
    override func viewWillAppear(_ inIsAnimated: Bool) {
        super.viewWillAppear(inIsAnimated)
        updateUI(status: status)
    }
}

/* ###################################################################################################################################### */
// MARK: Instance Methods
/* ###################################################################################################################################### */
extension ViewController {
    /* ################################################################## */
    /**
     This simply sets the "traffic lights" to reflect the current state.
     
     - parameter status: The status to display. We keep this around, in case we're called again.
     */
    func updateUI(status inStatus: AppStatus) {
        status = inStatus   // Keep it around, in case we are being called before the view hierarchy has been established.
        stopLight?.tintColor = (inStatus == .stop) ? .systemRed : .gray
        cautionLight?.tintColor = (inStatus == .caution) ? .systemYellow : .gray
        goLight?.tintColor = (inStatus == .go) ? .systemGreen : .gray
    }
}
