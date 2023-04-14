//
//  Container.swift
//  Swipe
//
//  Created by A. Zheng (github.com/aheze) on 4/12/23.
//  Copyright © 2023 A. Zheng. All rights reserved.
//

import SwiftUI
import SwipeActions

struct Container<Background: View>: View {
    var title: String
    var details: [String]
    var cornerRadius = Double(32)
    @ViewBuilder var background: Background

    init(title: String, details: String..., @ViewBuilder background: () -> Background) {
        self.title = title
        self.details = details
        self.background = background()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)

            if !details.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(details, id: \.self) { detail in
                        Text(detail)
                            .multilineTextAlignment(.leading)
                            .font(.system(.caption, design: .monospaced))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.vertical, 24)
        .background(background)
        .mask(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        )
    }
}

extension Container {
    init(title: String, details: [String], cornerRadius: Double = 32, @ViewBuilder background: () -> Background) {
        self.title = title
        self.details = details
        self.cornerRadius = cornerRadius
        self.background = background()
    }
}

extension Container where Background == Color {
    init(title: String, details: String..., cornerRadius: Double = 32, backgroundColor: Color = .primary.opacity(0.05)) {
        self.init(title: title, details: details, cornerRadius: cornerRadius) {
            backgroundColor
        }
    }
}
