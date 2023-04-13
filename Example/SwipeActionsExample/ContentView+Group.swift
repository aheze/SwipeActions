//
//  ContentView+Group.swift
//  SwipeActionsExample
//
//  Created by A. Zheng (github.com/aheze) on 4/13/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI
import SwipeActions

extension ContentView {
    var group: some View {
        SwipeViewGroup {
            VStack(spacing: 8) {
                SwipeView {
                    Text("Only one of us...")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(32)
                } leadingActions: { _ in
                    SwipeAction("Leading") {}
                } trailingActions: { context in
                    SwipeAction("Trailing") {}
                }

                SwipeView {
                    Text("... can be open...")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(32)
                } leadingActions: { _ in
                    SwipeAction("Leading") {}
                } trailingActions: { context in
                    SwipeAction("Trailing") {}
                }

                SwipeView {
                    Text("... at the same time.")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 32)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(32)
                } leadingActions: { _ in
                    SwipeAction("Leading") {}
                } trailingActions: { context in
                    SwipeAction("Trailing") {}
                }
            }
        }
    }
}
