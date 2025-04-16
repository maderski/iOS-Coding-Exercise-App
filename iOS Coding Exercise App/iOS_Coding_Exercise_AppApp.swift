//
//  iOS_Coding_Exercise_AppApp.swift
//  iOS Coding Exercise App
//
//  Created by Jason Maderski on 4/15/25.
//

import SwiftUI
//#if !DEBUG_PREVIEW
import shared
//#endif

@main
struct iOS_Coding_Exercise_AppApp: App {
    
    init() {
        //#if !DEBUG_PREVIEW
        KoinHelper.shared.doInitKoin(appModules: [])
        //#endif
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
