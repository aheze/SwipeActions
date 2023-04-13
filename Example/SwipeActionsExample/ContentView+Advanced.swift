//
//  ContentView+Advanced.swift
//  Swipe
//
//  Created by A. Zheng (github.com/aheze) on 4/12/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import Combine
import SwiftUI
import SwipeActions

extension ContentView {
    @ViewBuilder var advanced: some View {
        TapToOpenView()

        SwipeView {
            Container(
                title: "Continuous / Single Swipe Gesture",
                details:
                #".swipeAllowSingleSwipeAcross(true)"#,
                #"/// Lets you show leading and trailing actions in a single swipe, instead of rubber-banding."#
            ) {
                LinearGradient(
                    colors: [.yellow, .orange],
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
                .brightness(-0.5)
            }
            .foregroundColor(.white)
        } leadingActions: { _ in
            SwipeAction("Leading") {}
        } trailingActions: { context in
            SwipeAction("Trailing") {}
        }
        .swipeAllowSingleSwipeAcross(true)

        SwipeView {
            Container(
                title: "Adjusted Thresholds",
                details:
                #".swipeToTriggerTrailingEdge(true)"#,
                #".swipeReadyToExpandPadding(0)"#,
                #".swipeReadyToTriggerPadding(0)"#,
                #".swipeMinimumPointToTrigger(0)"#,
                #"/// Much easier to open, but harder to close."#
            ) {
                LinearGradient(
                    colors: [.pink, .purple],
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
                .brightness(-0.5)
            }
            .foregroundColor(.white)
        } leadingActions: { _ in

        } trailingActions: { context in
            SwipeAction("Trailing") {}
                .swipeActionEdgeStyling()
        }
        .swipeToTriggerTrailingEdge(true)
        .swipeReadyToExpandPadding(0)
        .swipeReadyToTriggerPadding(0)
        .swipeMinimumPointToTrigger(0)
    }
}

struct TapToOpenView: View {
    @State var open = PassthroughSubject<Void, Never>()
    @State var pressing = false

    var body: some View {
        SwipeView {
            Button {
                open.send()
            } label: {
                Container(
                    title: "Tap to Open!",
                    details:
                    #"@State var open = PassthroughSubject<Void, Never>()"#,
                    #"open.send()"#,
                    #""#,
                    #".onReceive(open) { _ in"#,
                    #"    context.wrappedValue.state = .expanded"#,
                    #"}"#
                ) {
                    LinearGradient(
                        colors: [.blue, .green],
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )
                    .brightness(-0.5)
                }
                .foregroundColor(.white)
                .brightness(pressing ? -0.2 : 0)
            }
            .buttonStyle(SwipeActionButtonStyle())
            ._onButtonGesture { pressing in
                self.pressing = pressing
            } perform: {}
        } leadingActions: { _ in
        } trailingActions: { context in
            SwipeAction("Tap to Close!") {
                context.wrappedValue.state = .closed
            }
            .onReceive(open) { _ in
                context.wrappedValue.state = .expanded
            }
        }
        .swipeActionWidth(180)
    }
}
