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

import SwiftUI

/* ###################################################################################################################################### */
// MARK: - Main Content View -
/* ###################################################################################################################################### */
/**
 The main content view is extremely simple. A label, with three "traffic lights" under it.
 */
struct ContentView: View {
    /* ################################################################## */
    /**
     This refers back to the app state. Since it's a binding, it will force a redraw, if that state changes.
     */
    @Binding var status: AppStatus
    
    /* ################################################################## */
    /**
     The main structure for the view.
     */
    var body: some View {
        VStack {
            Text("SWIFTUI")
                .font(.headline)
                .padding(8)
            HStack {
                Image(systemName: "circle.fill")
                    .renderingMode(.template)
                    .foregroundColor(status == .stop ? .red : .gray)
                Image(systemName: "circle.fill")
                    .renderingMode(.template)
                    .foregroundColor(status == .caution ? .yellow : .gray)
                Image(systemName: "circle.fill")
                    .renderingMode(.template)
                    .foregroundColor(status == .go ? .green : .gray)
            }
        }
    }
}
