//
//  SwipeActionsExampleApp.swift
//  SwipeActionsExample
//
//  Created by A. Zheng (github.com/aheze) on 4/12/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//
    

import SwiftUI

@main
struct SwipeActionsExampleApp: App {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some Scene {
        WindowGroup {
            ContentView()
#if os(iOS)
                .environment(\.backgroundColor, Color(colorScheme == .light ? .systemBackground : .secondarySystemBackground))
                .environment(\.secondaryBackgroundColor, Color(colorScheme == .light ? .secondarySystemBackground : .systemBackground))
#endif
        }
    }
}
