//
//  ContentView.swift
//  SwipeActionsExample
//
//  Created by A. Zheng (github.com/aheze) on 4/12/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import Combine
import SwiftUI
import SwipeActions

enum DemoSectionKind: String, CaseIterable {
    case basics
    case customization
    case styles
    case animations
    case advanced
    case group
}

struct ContentView: View {
    @Environment(\.backgroundColor) var backgroundColor
    @Environment(\.secondaryBackgroundColor) var secondaryBackgroundColor

    @State var showingSwipeToTrigger = true
    @State var showingMultiplePlusSwipeToTrigger = true
    @State var showingCustomizationClear = true
    @State var showingStylesSwipeToDelete = true
    @State var showingAlternateFooter = false

    @State var expandedSectionKinds = DemoSectionKind.allCases
    @State var showingDebug = false
    
    /// Calculatable `ToolbarItemPlacement` modifier for iOS and macOS platforms 
    private var toolbarGroupPlacement: ToolbarItemPlacement {
        #if os(iOS)
        return .navigationBarTrailing
        #else
        return .automatic
        #endif
    }

    var body: some View {
        VStack {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    content
                        .background(secondaryBackgroundColor)
                        .navigationTitle("SwipeActions")
                }
            } else {
                NavigationView {
                    content
                        .background(secondaryBackgroundColor)
                        .navigationTitle("SwipeActions")
                }
            }
        }
        .sheet(isPresented: $showingDebug) {
            DebugView()
        }
    }

    var content: some View {
        ScrollView {
            VStack(spacing: 12) {
                DemoSection(expandedSectionKinds: $expandedSectionKinds, kind: .basics) {
                    VStack(spacing: 8) {
                        basics
                    }
                }

                DemoSection(expandedSectionKinds: $expandedSectionKinds, kind: .customization) {
                    VStack(spacing: 8) {
                        customization
                    }
                    .padding(12)
                    .background(
                        LinearGradient(
                            colors: [.orange, .yellow],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .overlay(
                            Circle()
                                .fill(Color.pink)
                                .frame(width: 500, height: 500)
                                .blur(radius: 100)
                                .offset(x: -250, y: -250),
                            alignment: .topLeading
                        )
                        .overlay(
                            Circle()
                                .fill(Color.green)
                                .frame(width: 800, height: 800)
                                .blur(radius: 150)
                                .offset(x: 500, y: 500),
                            alignment: .bottomTrailing
                        )
                    )
                    .cornerRadius(44)
                }

                DemoSection(expandedSectionKinds: $expandedSectionKinds, kind: .styles) {
                    VStack(spacing: 0) {
                        styles
                    }
                    .background(backgroundColor)
                    .mask(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                    )
                }

                DemoSection(expandedSectionKinds: $expandedSectionKinds, kind: .animations) {
                    VStack(spacing: 8) {
                        animations
                    }
                }

                DemoSection(expandedSectionKinds: $expandedSectionKinds, kind: .advanced) {
                    VStack(spacing: 8) {
                        advanced
                    }
                }

                DemoSection(expandedSectionKinds: $expandedSectionKinds, kind: .group) {
                    group
                }

                SwipeView {
                    VStack {
                        if showingAlternateFooter {
                            Text("😀")
                                .font(.system(size: 100))
                                .transition(.scale(scale: 1.2).combined(with: .opacity))
                        } else {
                            VStack(spacing: 16) {
                                Image("SwipeActions")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 120)

                                Text("[Made by A. Zheng](https://twitter.com/aheze0)")
                                    .font(.system(.body, design: .monospaced).weight(.semibold))

                                Text("[View on GitHub](https://github.com/aheze/SwipeActions)")
                                    .font(.system(.body, design: .monospaced).weight(.semibold))
                            }
                            .multilineTextAlignment(.center)
                            .accentColor(.primary)
                            .padding(.top, 20)
                            .transition(.scale(scale: 0.8).combined(with: .opacity))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle()) /// Allow blank space to be swipeable too.
                } leadingActions: { _ in
                } trailingActions: { context in
                    SwipeAction(systemImage: "face.smiling") {
                        context.state.wrappedValue = .closed
                        withAnimation(.spring()) {
                            showingAlternateFooter.toggle()
                        }
                    }
                    .allowSwipeToTrigger()
                    .font(.largeTitle)
                }
            }
            .padding(.top, 8)
            .padding(.horizontal, 20)
            .padding(.bottom, 32)
        }
        .toolbar {
            ToolbarItemGroup(placement: toolbarGroupPlacement) {
                let shouldExpandAll: Bool = {
                    if expandedSectionKinds.count == DemoSectionKind.allCases.count {
                        return false
                    } else {
                        return true
                    }
                }()

                Button {
                    withAnimation {
                        showingDebug.toggle()
                    }
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }

                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 1, blendDuration: 1)) {
                        if shouldExpandAll {
                            expandedSectionKinds = DemoSectionKind.allCases
                        } else {
                            expandedSectionKinds = []
                        }
                    }
                } label: {
                    Image(systemName: shouldExpandAll ? "arrow.up.backward.and.arrow.down.forward" : "arrow.down.forward.and.arrow.up.backward")
                        .animation(nil)
                }
            }
        }
    }
}

struct DemoSection<Content: View>: View {
    @Binding var expandedSectionKinds: [DemoSectionKind]
    var kind: DemoSectionKind
    @ViewBuilder var content: Content

    var body: some View {
        let expanded = Binding {
            expandedSectionKinds.contains(kind)
        } set: { newValue in
            if newValue {
                if !expandedSectionKinds.contains(kind) {
                    expandedSectionKinds.append(kind)
                }
            } else {
                expandedSectionKinds = expandedSectionKinds.filter { $0 != kind }
            }
        }

        VStack(alignment: .leading, spacing: 8) {
            SwipeView {
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 1, blendDuration: 1)) {
                        expanded.wrappedValue.toggle()
                    }
                } label: {
                    HStack {
                        Text(kind.rawValue.capitalized)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Image(systemName: "chevron.right")
                            .rotationEffect(.degrees(expanded.wrappedValue ? 90 : 0))
                    }
#if os(iOS)
                    .foregroundColor(.primary)
#else
                    .foregroundColor(.black)
#endif
                    .font(.title3.weight(.bold))
                    .padding(.horizontal, 24)
                    .padding(.vertical)
#if os(iOS)
                    .background(VisualEffectView(.systemChromeMaterial))
#endif
                    .cornerRadius(32)
                    .environment(\.colorScheme, .dark)
                }
            } leadingActions: { _ in
            } trailingActions: { context in
                SwipeAction {
                    withAnimation(.spring(response: 0.4, dampingFraction: 1, blendDuration: 1)) {
                        expanded.wrappedValue.toggle()
                        context.state.wrappedValue = .closed
                    }
                } label: { highlight in
                    Text(expanded.wrappedValue ? "Close" : "Open")
                        .font(.title3.weight(.medium))
                        .environment(\.colorScheme, .dark)
                } background: { highlight in
#if os(iOS)
                    VisualEffectView(.systemChromeMaterial)
                        .environment(\.colorScheme, .dark)
#endif
                }
                .allowSwipeToTrigger()
            }
            .swipeActionWidth(120)

            if expanded.wrappedValue {
                content
                    .padding(.bottom, 24)
            }
        }
    }
}

/// Use UIKit blurs in SwiftUI.
#if os(iOS)
struct VisualEffectView: UIViewRepresentable {
    /// The blur's style.
    public var style: UIBlurEffect.Style

    /// Use UIKit blurs in SwiftUI.
    public init(_ style: UIBlurEffect.Style) {
        self.style = style
    }

    public func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView()
    }

    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
#endif

private struct BackgroundColorKey: EnvironmentKey {
    #if os(iOS)
    static let defaultValue = Color(.systemBackground)
    #else
    static let defaultValue = Color(.windowBackgroundColor)
    #endif
}

private struct SecondaryBackgroundColorKey: EnvironmentKey {
    #if os(iOS)
    static let defaultValue = Color(.secondarySystemBackground)
    #else
    static let defaultValue = Color(.windowBackgroundColor)
    #endif
}

extension EnvironmentValues {
    /// Inner view
    var backgroundColor: Color {
        get { self[BackgroundColorKey.self] }
        set { self[BackgroundColorKey.self] = newValue }
    }

    /// Outer view
    var secondaryBackgroundColor: Color {
        get { self[SecondaryBackgroundColorKey.self] }
        set { self[SecondaryBackgroundColorKey.self] = newValue }
    }
}
