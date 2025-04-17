//
//  iOS_Coding_Exercise_AppApp.swift
//  iOS Coding Exercise App
//
//  Created by Jason Maderski on 4/15/25.
//

import SwiftUI
import shared


@main
struct iOS_Coding_Exercise_App: App {
    
    init() {
        KoinHelper.shared.doInitKoin(appModules: [])
    }
    
    var body: some Scene {
        WindowGroup {
            DisplayItemsView()
        }
    }
}
