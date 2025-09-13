//
//  PillGridView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import SwiftUI
import SwiftfulUI //this package has a built in grid

struct athletePill{
    let id = UUID().uuidString // lets us auto fill id, doesnt matter value
    var iconName: String? = nil // can be any icon
    var emoji: String? = nil // can be any emoji
    var text: String
}


struct PillGridView: View {
    var stats: [athletePill] = Athlete.mock1.pills
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(stats, id: \.id) { pill in
                    PillView(iconName: pill.iconName, emoji: pill.emoji, text: pill.text)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    PillGridView(stats: [
            athletePill(iconName: nil, emoji: "💪", text: "195 lbs"),
            athletePill(iconName: nil, emoji: "📏", text: "73 in"),
            athletePill(iconName: nil, emoji: "🤽‍♂️", text: "QB")
        ])
    }
