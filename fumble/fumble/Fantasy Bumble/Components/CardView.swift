//
//  CardView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import SwiftUI
import SwiftfulUI

struct CardView: View {
    
    var athlete: Athlete = .mock3
    
    @State private var cardFrame: CGRect = .zero // this makes it so the image isnt messed up on diff screens
    
    var body: some View {
        ScrollView(.vertical){
            LazyVStack (spacing:0){ //lazy loader like at thescore, we do this so it doesnt load the images until users acc get to it, helps w load times and consumption
               headerCell.frame(height: 600)
                aboutSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                
                
                VStack(alignment: .leading, spacing: 12){
                    VStack(alignment: .leading, spacing: 8){
                        sectionTitle(title: "About")
                        PillGridView(stats: athlete.pills)
                    }
                }
            }
            
        }
        .scrollIndicators(.hidden)
        .background(.NFLBG)
        .cornerRadius(32)
        .readingFrame{ frame in
            cardFrame = frame} // we apply the cardframe so the image isnt messed up regardless of device, so if im on a ipod or something smaller it isnt super zoomed in
        
    }
    
    private var headerCell: some View {
        ZStack (alignment: .bottomLeading){
            ImageLoaderView(urlString: "https://bloximages.chicago2.vip.townnews.com/tucson.com/content/tncms/assets/v3/editorial/2/26/2263e41b-963a-5534-a90f-b93b2eedb0a9/65b1bd640dc36.image.jpg?resize=1200%2C800")
                
            VStack(alignment: .leading){
                Text("\(athlete.displayName), #\(athlete.jersey)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                    
                HStack (spacing: 4){
                    Image(systemName: "football")
                    Text("\(athlete.position.abbreviation.rawValue) - \(athlete.team.displayName.rawValue), Age: \(athlete.age)")
                }
                
                HStack (spacing: 4){
                    Image(systemName: "heart")
                    let injuryText = athlete.injuries?.first?.status.rawValue ?? "None"
                    Text("\(athlete.status.type.rawValue), Injuries: \(injuryText)")
                }
                FaveView()
                    .onTapGesture {
                    }
                
            }
            
            .padding(18)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundColor(.nflWhite)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    colors: [
                        .nflBlack.opacity(0),
                        .nflBlack.opacity(0.7),
                        .nflBlack.opacity(0.7),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
        }
    }
    
    private func sectionTitle(title: String) -> some View{
        Text(title)
            .font(.body)
            .foregroundStyle(.nflGray)
    }
    
    private var aboutSection: some View{
        VStack(alignment: .leading, spacing: 12){
            sectionTitle(title: "Injury Report")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(injuryReport(for: athlete))
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.nflBlack)
            
            HStack(spacing: 0){
                FaveView()
                Text("Add to Favourites")
                    .foregroundStyle(.nflWhite)
                    .padding(.horizontal, 5)
                    .font(.headline)
                    .fontWeight(.semibold)
                    
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 8)
            .background(.nflBlue)
            .cornerRadius(32)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func injuryReport(for athlete: Athlete) -> String {
            if let injury = athlete.injuries?.first {
                let injuryType = injury.details.type
                let returnDate = injury.details.returnDate
                let status = injury.status.rawValue
                return "\(athlete.displayName) is currently injured (\(injuryType)). Status: \(status). Expected return: \(returnDate)."
            } else {
                return "No reported injuries for \(athlete.displayName). \(athlete.lastName) is expected to play this week."
            }
        }
    
    
}

#Preview {
    CardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
