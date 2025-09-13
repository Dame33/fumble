//
//  PillView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import SwiftUI

struct PillView: View {
    var iconName: String? = "heart.fill" //optional string incase i wanna use an emoji or sf symbol
    var emoji: String? = "🥇"
    
    var text: String = "position"
    
    var body: some View {
        HStack(spacing: 4){
            if let iconName {
                Image(systemName: iconName)
            }
            else if let emoji {
                Text(emoji)
                    
            }
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .foregroundStyle(.nflBlack)
        .background(.nflBlue)
        .cornerRadius(32)
    }
}

#Preview {
    VStack{
        PillView(iconName: nil)
        PillView()
        PillView()
        
    }
}
