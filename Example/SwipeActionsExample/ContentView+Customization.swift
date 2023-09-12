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
#if os(iOS)
                    VisualEffectView(.systemThinMaterial)
#endif
                }
            } trailingActions: { _ in
                SwipeAction {} label: { highlight in
                    Text("Options")
                } background: { highlight in
#if os(iOS)
                    VisualEffectView(.systemThinMaterial)
                        .brightness(highlight ? -0.1 : 0)
#endif
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
#if os(iOS)
                    VisualEffectView(.systemThinMaterial)
                        .brightness(highlight ? -0.1 : 0)
#endif
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
#if os(iOS)
                VisualEffectView(.systemThickMaterial)
#endif
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
#if os(iOS)
                VisualEffectView(.systemChromeMaterial)
#endif
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
