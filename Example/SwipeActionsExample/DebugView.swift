//
//  DebugView.swift
//  SwipeActionsExample
//
//  Created by A. Zheng (github.com/aheze) on 4/12/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI
import SwipeActions

struct DebugView: View {
    @State var selectedTag: String?

    var body: some View {
        VStack {
            RowSwipeView(selectedTag: $selectedTag, tag: "First")
            RowSwipeView(selectedTag: $selectedTag, tag: "Second")
            RowSwipeView(selectedTag: $selectedTag, tag: "Third")
        }
        .padding()
    }
}

struct RowSwipeView: View {
    @Binding var selectedTag: String?
    var tag: String

    var body: some View {
        SwipeView {
            Text(tag)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(32)
        } leadingActions: { _ in
            SwipeAction("Leading") {}
//                .swipeSelection(selectedTag: $selectedTag, tag: tag)
        } trailingActions: { context in
            SwipeAction("Trailing") {}
//                .swipeSelection(selectedTag: $selectedTag, tag: tag)
        }
        .swipeSelection(selectedTag: $selectedTag, tag: tag)
    }
}

//extension View {
//    func swipeSelection<Tag: Equatable>(selectedTag: Binding<Tag?>, tag: Tag) -> some View {
//        modifier(
//            SwipeSelectionModifier(selectedTag: selectedTag, tag: tag)
//        )
//    }
//}

struct SwipeSelectionModifier<Tag: Equatable>: ViewModifier {
    @Binding var selectedTag: Tag?
    var tag: Tag

    @Environment(\.swipeContext) var swipeContext

    func body(content: Content) -> some View {
        content
            .onChange(of: swipeContext.currentlyDragging) { newValue in
                if newValue {
                    selectedTag = tag
                }
            }
            .onChange(of: swipeContext.state.wrappedValue) { newValue in
                if newValue == .closed, selectedTag == tag {
                    selectedTag = nil
                }
            }
            .onChange(of: selectedTag) { newValue in
                if selectedTag != tag, swipeContext.state.wrappedValue != .closed {
                    print("Closing \(tag)")
                    swipeContext.state.wrappedValue = .closed
                }
            }
    }
}

// struct DebugView: View {
//    @State var showingCustomizationClear = true
//    @State var hue = false
//    @State var bright = false
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        SwipeView {
//            Text("Hello")
//                .frame(maxWidth: .infinity)
//                .padding(.vertical, 32)
//                .background(Color.blue.opacity(0.1))
//                .cornerRadius(32)
//        } leadingActions: { _ in
//        } trailingActions: { _ in
//            SwipeAction("World") {}
//        }
//        .padding()
//
////        Color.clear.overlay {
////            LinearGradient(
////                colors: [.blue, .teal],
////                startPoint: .top,
////                endPoint: .bottom
////            )
////            .overlay(
////                Circle()
////                    .fill(Color.green)
////                    .frame(width: 500, height: 500)
////                    .blur(radius: 100)
////                    .offset(x: -250, y: -250),
////                alignment: .topLeading
////            )
////            .overlay(
////                Circle()
////                    .fill(Color.purple)
////                    .frame(width: 800, height: 800)
////                    .blur(radius: 150)
////                    .offset(x: 500, y: 500),
////                alignment: .bottomTrailing
////            )
////            .drawingGroup()
////            .hueRotation(.degrees(hue ? 90 : 0))
////            .brightness(bright ? 1 : 0)
////            .ignoresSafeArea()
////            .onTapGesture {
////                presentationMode.wrappedValue.dismiss()
////            }
////        }
////        .overlay {
////            VStack(spacing: 12) {
////                if showingCustomizationClear {
////                    view
////                }
////                view
////                view
////            }
////            .padding(.horizontal, 20)
////        }
//    }
//
//    var view: some View {
//        SwipeView {
//            HStack {
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("SwipeActions")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//
//                    Text("Swipe for options")
//                        .multilineTextAlignment(.leading)
//                        .font(.system(.body, design: .monospaced))
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//
//                Image(systemName: "moon.fill")
//                    .foregroundStyle(.secondary)
//                    .font(.title3)
//            }
//            .padding(.horizontal, 24)
//            .padding(.vertical, 24)
//            .background(.thinMaterial)
//            .mask(
//                RoundedRectangle(cornerRadius: 32, style: .continuous)
//            )
//        } leadingActions: { _ in
//            SwipeAction {
//                withAnimation(.spring(response: 0.8, dampingFraction: 0.4, blendDuration: 1)) {
//                    hue = true
//                }
//            } label: { highlight in
//                Image(systemName: "square.and.arrow.up")
//                    .font(.title3)
//                    .opacity(0.75)
//            } background: { highlight in
//                VisualEffectView(.systemThinMaterial)
//                    .brightness(highlight ? -0.1 : 0)
//            }
//        } trailingActions: { _ in
//            SwipeAction {
//                withAnimation(.spring(response: 0.8, dampingFraction: 0.4, blendDuration: 1)) {
//                    hue = true
//                }
//            } label: { highlight in
//                Text("Options")
//                    .opacity(0.75)
//            } background: { highlight in
//                VisualEffectView(.systemThinMaterial)
//                    .brightness(highlight ? -0.1 : 0)
//            }
//
//            SwipeAction {
//                withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
//                    showingCustomizationClear = false
//                }
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//                    withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
//                        showingCustomizationClear = true
//                    }
//                }
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                    withAnimation(.spring(response: 2.5, dampingFraction: 1, blendDuration: 1)) {
//                        bright = true
//                    }
//                }
//
//            } label: { highlight in
//                Text("Clear")
//                    .opacity(0.75)
//            } background: { highlight in
//                VisualEffectView(.systemThinMaterial)
//                    .brightness(highlight ? -0.1 : 0)
//            }
//            .swipeActionEdgeStyling()
//        }
//        .swipeToTriggerTrailingEdge(true)
//        .swipeActionWidth(120)
//    }
// }
