//
//  ContentView+Animations.swift
//  Swipe
//
//  Created by A. Zheng (github.com/aheze) on 4/12/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI
import SwipeActions

extension ContentView {
    @ViewBuilder var animations: some View {
        SwipeView {
            Container(
                title: "Default",
                details:
                #".swipeOffsetCloseAnimation(stiffness: 160, damping: 70)"#,
                #".swipeOffsetExpandAnimation(stiffness: 160, damping: 70)"#,
                #".swipeOffsetTriggerAnimation(stiffness: 160, damping: 70)"#
            ) {
                Color.blue.opacity(0.05)
                    .overlay(
                        RoundedRectangle(cornerRadius: 32, style: .continuous)
                            .strokeBorder(Color.blue, lineWidth: 2)
                    )
            }
        } trailingActions: { context in
            SwipeAction("1") {}
            SwipeAction("2") {}
            SwipeAction("3") {}
        }
        .swipeOffsetCloseAnimation(stiffness: 160, damping: 70)
        .swipeOffsetExpandAnimation(stiffness: 160, damping: 70)
        .swipeOffsetTriggerAnimation(stiffness: 160, damping: 70)

        SwipeView {
            Container(
                title: "Heavy",
                details:
                #".swipeOffsetCloseAnimation(stiffness: 500, damping: 600)"#,
                #".swipeOffsetExpandAnimation(stiffness: 500, damping: 600)"#,
                #".swipeOffsetTriggerAnimation(stiffness: 500, damping: 600)"#
            ) {
                Color.green.opacity(0.05)
                    .overlay(
                        RoundedRectangle(cornerRadius: 32, style: .continuous)
                            .strokeBorder(Color.green, lineWidth: 2)
                    )
            }
        } trailingActions: { context in
            SwipeAction("1") {}
            SwipeAction("2") {}
            SwipeAction("3") {}
        }
        .swipeOffsetCloseAnimation(stiffness: 500, damping: 600)
        .swipeOffsetExpandAnimation(stiffness: 500, damping: 600)
        .swipeOffsetTriggerAnimation(stiffness: 500, damping: 600)

        SwipeView {
            Container(
                title: "Light",
                details:
                #".swipeOffsetCloseAnimation(stiffness: 20, damping: 60)"#,
                #".swipeOffsetExpandAnimation(stiffness: 20, damping: 60)"#,
                #".swipeOffsetTriggerAnimation(stiffness: 20, damping: 60)"#
            ) {
                Color.yellow.opacity(0.05)
                    .overlay(
                        RoundedRectangle(cornerRadius: 32, style: .continuous)
                            .strokeBorder(Color.yellow, lineWidth: 2)
                    )
            }
        } trailingActions: { context in
            SwipeAction("1") {}
            SwipeAction("2") {}
            SwipeAction("3") {}
        }
        .swipeOffsetCloseAnimation(stiffness: 20, damping: 60)
        .swipeOffsetExpandAnimation(stiffness: 20, damping: 60)
        .swipeOffsetTriggerAnimation(stiffness: 20, damping: 60)
    }
}
