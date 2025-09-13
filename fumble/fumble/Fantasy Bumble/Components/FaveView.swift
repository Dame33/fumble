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
                .fill(.nflWhite)
                .frame(width: 40, height: 40)
            
            Image(systemName: "star.fill")
                .foregroundColor(.nflFlame)
                .font(.system(size:22))
        }
        
    }
}

#Preview {
    FaveView()
}
