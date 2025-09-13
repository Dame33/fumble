//
//  ContentView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    @State private var athletes: [Athlete] = []
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(athletes) { athlete in
                    Text(athlete.displayName)
                }
            }
            .padding()
        }
        .task{
            await getData()
        }
    }
    
    private func getData() async{
        do {
            athletes = try await DatabaseHelper().getAthlete()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
