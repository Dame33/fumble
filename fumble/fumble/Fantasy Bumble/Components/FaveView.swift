//
//  FaveView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import SwiftUI

struct FaveView: View {
    var body: some View {
        ZStack() {
            Circle()
                .fill(.nflBetterblue)
                .frame(width: 40, height: 40)
            
            Image(systemName: "bookmark.fill")
                .foregroundColor(.nflOffwhite)
                .font(.system(size:22))
        }
        
        
    }
}

#Preview {
    FaveView()
}
