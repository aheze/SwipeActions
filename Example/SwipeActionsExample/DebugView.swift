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
    @State var showingCustomizationClear = true
    @State var hue = false
    @State var bright = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Color.clear.overlay {
            LinearGradient(
                colors: [.blue, .teal],
                startPoint: .top,
                endPoint: .bottom
            )
            .overlay(
                Circle()
                    .fill(Color.green)
                    .frame(width: 500, height: 500)
                    .blur(radius: 100)
                    .offset(x: -250, y: -250),
                alignment: .topLeading
            )
            .overlay(
                Circle()
                    .fill(Color.purple)
                    .frame(width: 800, height: 800)
                    .blur(radius: 150)
                    .offset(x: 500, y: 500),
                alignment: .bottomTrailing
            )
            .drawingGroup()
            .hueRotation(.degrees(hue ? 90 : 0))
            .brightness(bright ? 1 : 0)
            .ignoresSafeArea()
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .overlay {
            VStack {
                if showingCustomizationClear {
                    SwipeView {
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("SwipeActions")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                
                                Text("Swipe for options")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(.title2, design: .monospaced))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                         
                            Image(systemName: "moon.fill")
                                .foregroundStyle(.secondary)
                                .font(.largeTitle)
                        }
                        .padding(.horizontal, 36)
                        .padding(.vertical, 32)
                        .background(.thinMaterial)
                        .mask(
                            RoundedRectangle(cornerRadius: 32, style: .continuous)
                        )
                    } leadingActions: { _ in
                    } trailingActions: { _ in
                        SwipeAction {
                            withAnimation(.spring(response: 0.8, dampingFraction: 0.4, blendDuration: 1)) {
                                hue = true
                            }
                        } label: { highlight in
                            Text("Options")
                                .font(.title3)
                                .opacity(0.75)
                        } background: { highlight in
                            VisualEffectView(.systemThinMaterial)
                                .brightness(highlight ? -0.1 : 0)
                        }
                        
                        SwipeAction {
                            withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
                                showingCustomizationClear = false
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
                                    showingCustomizationClear = true
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(.spring(response: 2.5, dampingFraction: 1, blendDuration: 1)) {
                                    bright = true
                                }
                            }
                            
                        } label: { highlight in
                            Text("Clear")
                                .font(.title3)
                                .opacity(0.75)
                        } background: { highlight in
                            VisualEffectView(.systemThinMaterial)
                                .brightness(highlight ? -0.1 : 0)
                        }
                        .swipeActionEdgeStyling()
                    }
                    .swipeReadyToTriggerPadding(60)
                    .swipeActionWidth(140)
                    .swipeToTriggerTrailingEdge(true)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
