//
//  ContentView+Basic.swift
//  Swipe
//
//  Created by A. Zheng (github.com/aheze) on 4/12/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI
import SwipeActions

extension ContentView {
    @ViewBuilder var basics: some View {
        SwipeView {
            Container(title: "Basic")
        } trailingActions: { _ in
            SwipeAction("Tap Me!") {}
        }

        SwipeView {
            Container(title: "Left and Right")
        } leadingActions: { _ in
            SwipeAction("Left") {}
        } trailingActions: { _ in
            SwipeAction("Right") {}
        }

        SwipeView {
            Container(title: "Multiple", details: #"SwipeAction("1") {}"#, #"SwipeAction("2") {}"#)
        } trailingActions: { _ in
            SwipeAction("1") {}
            SwipeAction("2") {}
        }

        if showingSwipeToTrigger {
            SwipeView {
                Container(title: "Swipe to Trigger", details: ".allowSwipeToTrigger()")
            } trailingActions: { _ in
                SwipeAction("Clear") {
                    withAnimation(.spring()) {
                        showingSwipeToTrigger = false
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.spring()) {
                            showingSwipeToTrigger = true
                        }
                    }
                }
                .allowSwipeToTrigger()
            }
        }

        if showingMultiplePlusSwipeToTrigger {
            SwipeView {
                Container(
                    title: "Multiple + Swipe to Trigger",
                    details:
                    #"SwipeAction("1") {}"#,
                    #"SwipeAction("Dismiss") {}"#,
                    ".allowSwipeToTrigger()"
                )
            } trailingActions: { _ in
                SwipeAction("1") {}
                SwipeAction("Dismiss") {
                    withAnimation(.spring()) {
                        showingMultiplePlusSwipeToTrigger = false
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.spring()) {
                            showingMultiplePlusSwipeToTrigger = true
                        }
                    }
                }
                .allowSwipeToTrigger()
            }
        }

        SwipeView {
            Text("Swipe to Trigger, Then Return")
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(32)
        } trailingActions: { context in
            SwipeAction("Bounce Back") {
                context.state.wrappedValue = .closed
            }
            .allowSwipeToTrigger()
        }
        .swipeActionWidth(140)
    }
}
