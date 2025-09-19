//
//  ReportView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-19.
//

import SwiftUI

struct ReportView: View {
    var body: some View {
        HStack{
            Text("Report an Issue")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.nflGray)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .onTapGesture {
                }
        }
    }
}

#Preview {
    ReportView()
}
