//
//  ContentView+Styles.swift
//  Swipe
//
//  Created by A. Zheng (github.com/aheze) on 4/12/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI
import SwipeActions

extension ContentView {
    @ViewBuilder var styles: some View {
        SwipeView {
            Container(title: "Mask Style (Default)", details: ".swipeActionsStyle(.mask)", cornerRadius: 0, backgroundColor: .clear)
                .contentShape(Rectangle())
        } leadingActions: { _ in
            SwipeAction("One", backgroundColor: .red) {}
                .foregroundColor(.white)

            SwipeAction("Two", backgroundColor: .orange) {}
                .foregroundColor(.white)
        } trailingActions: { _ in
            SwipeAction("Three", backgroundColor: .green) {}
                .foregroundColor(.white)

            SwipeAction("Four", backgroundColor: .blue) {}
                .foregroundColor(.white)
        }
        .swipeActionsStyle(.mask)
        .swipeActionCornerRadius(0)
        .swipeSpacing(0)
        .swipeActionsMaskCornerRadius(0)

        Divider()

        SwipeView {
            Container(title: "Equal Widths Style", details: ".swipeActionsStyle(.equalWidths)", ".swipeActionChangeLabelVisibilityOnly(true)", cornerRadius: 0, backgroundColor: .clear)
                .contentShape(Rectangle())
        } leadingActions: { _ in
            SwipeAction("One", backgroundColor: .red) {}
                .swipeActionChangeLabelVisibilityOnly(true)
                .foregroundColor(.white)

            SwipeAction("Two", backgroundColor: .orange) {}
                .swipeActionChangeLabelVisibilityOnly(true)
                .foregroundColor(.white)
        } trailingActions: { _ in
            SwipeAction("Three", backgroundColor: .green) {}
                .swipeActionChangeLabelVisibilityOnly(true)
                .foregroundColor(.white)

            SwipeAction("Four", backgroundColor: .blue) {}
                .swipeActionChangeLabelVisibilityOnly(true)
                .foregroundColor(.white)
        }
        .swipeActionsStyle(.equalWidths)
        .swipeActionCornerRadius(0)
        .swipeSpacing(0)
        .swipeActionsMaskCornerRadius(0)

        Divider()

        SwipeView {
            Container(title: "Cascade Style", details: ".swipeActionsStyle(.cascade)", cornerRadius: 0, backgroundColor: .clear)
                .contentShape(Rectangle())
        } leadingActions: { _ in
            SwipeAction("One", backgroundColor: .red) {}
                .foregroundColor(.white)

            SwipeAction("Two", backgroundColor: .orange) {}
                .foregroundColor(.white)
        } trailingActions: { _ in
            SwipeAction("Three", backgroundColor: .green) {}
                .foregroundColor(.white)

            SwipeAction("Four", backgroundColor: .blue) {}
                .foregroundColor(.white)
        }
        .swipeActionsStyle(.cascade)
        .swipeActionsVisibleStartPoint(0)
        .swipeActionsVisibleEndPoint(0)
        .swipeActionCornerRadius(0)
        .swipeSpacing(0)
        .swipeActionsMaskCornerRadius(0)

        Divider()

        if showingStylesSwipeToDelete {
            SwipeView {
                Container(title: "Swipe to Delete", details: ".transition(.swipeDelete)", cornerRadius: 0, backgroundColor: .clear)
                    .contentShape(Rectangle())
            } trailingActions: { _ in
                SwipeAction(systemImage: "trash", backgroundColor: .red, highlightOpacity: 1) {
                    withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
                        showingStylesSwipeToDelete = false
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.spring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                            showingStylesSwipeToDelete = true
                        }
                    }
                }
                .allowSwipeToTrigger()
                .font(.title3.weight(.medium))
                .foregroundColor(.white)
            }
            .swipeActionCornerRadius(0)
            .swipeSpacing(0)
            .swipeActionsMaskCornerRadius(0)
            .transition(.swipeDelete)

            Divider()
        }

        SwipeView {
            Container(title: "Don't Fade", details: ".swipeActionsVisibleStartPoint(0)", ".swipeActionsVisibleEndPoint(0)", cornerRadius: 0, backgroundColor: .clear)
                .contentShape(Rectangle())
        } trailingActions: { _ in
            SwipeAction("One", backgroundColor: .green) {}
                .foregroundColor(.white)

            SwipeAction("Two", backgroundColor: .blue) {}
                .foregroundColor(.white)
        }
        .swipeActionsVisibleStartPoint(0)
        .swipeActionsVisibleEndPoint(0)
        .swipeActionCornerRadius(0)
        .swipeSpacing(0)
        .swipeActionsMaskCornerRadius(0)
    }
}
