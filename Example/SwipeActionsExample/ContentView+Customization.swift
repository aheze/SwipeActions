//
//  ContentView+Customization.swift
//  Swipe
//
//  Created by A. Zheng (github.com/aheze) on 4/12/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI
import SwipeActions

extension ContentView {
    @ViewBuilder var customization: some View {
        if showingCustomizationClear {
            SwipeView {
                Container(title: "Notification", details: "Swipe for options") {
                    VisualEffectView(.systemThinMaterial)
                }
            } trailingActions: { _ in
                SwipeAction {} label: { highlight in
                    Text("Options")
                } background: { highlight in
                    VisualEffectView(.systemThinMaterial)
                        .brightness(highlight ? -0.1 : 0)
                }

                SwipeAction {
                    withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
                        showingCustomizationClear = false
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
                            showingCustomizationClear = true
                        }
                    }

                } label: { highlight in
                    Text("Clear")
                } background: { highlight in
                    VisualEffectView(.systemThinMaterial)
                        .brightness(highlight ? -0.1 : 0)
                }
                .allowSwipeToTrigger()
            }
        }

        SwipeView {
            Container(
                title: "Built-In Templates",
                details:
                #"SwipeAction("#,
                #"    systemImage: "square.and.arrow.up","#,
                #"    backgroundColor: .blue"#,
                #") {}"#
            ) {
                VisualEffectView(.systemThickMaterial)
            }
        } trailingActions: { _ in
            SwipeAction(
                systemImage: "square.and.arrow.up",
                backgroundColor: .blue
            ) {}
                .font(.title.weight(.bold))
                .foregroundColor(.white)
        }

        SwipeView {
            Container(
                title: "Only Change Label Opacity",
                details:
                #"SwipeAction("#,
                #"    systemImage: "checkmark.circle.fill","#,
                #"    backgroundColor: .purple"#,
                #") {}"#,
                #"    .swipeActionChangeLabelVisibilityOnly(true)"#
            ) {
                VisualEffectView(.systemChromeMaterial)
            }
        } trailingActions: { _ in
            SwipeAction(
                systemImage: "checkmark.circle.fill",
                backgroundColor: .purple
            ) {}
                .swipeActionChangeLabelVisibilityOnly(true)
                .font(.title.weight(.bold))
                .foregroundColor(.white)
        }
    }
}
