//
//  CardView.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import SwiftUI
import SwiftfulUI

struct CardView: View {
    
    var athlete: Athlete = .mock1
    
    //action buttons now
    var favouritePressed :(() -> Void)? = nil
    var onStartPressed :(() -> Void)? = nil
    var onBenchPressed :(() -> Void)? = nil
    var messagesPressed :(() -> Void)? = nil
    var reportPressed :(() -> Void)? = nil
    
    @State private var cardFrame: CGRect = .zero // this makes it so the image isnt messed up on diff screens
    
    var body: some View {
        ScrollView(.vertical){
            LazyVStack (spacing:0, ){ //lazy loader like at thescore, we do this so it doesnt load the images until users acc get to it, helps w load times and consumption
                headerCell.frame(height: 600)
                
                injurySection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                Divider()
                aboutView .padding(.vertical, 12)
                
                //add 2nd and 3rd pics, sorta like action shots
                ForEach(athlete.images, id: \.self) { image in
                   ImageLoaderView(urlString: image)
                         .frame(height: 220)
                         .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                         .shadow(radius: 4)
                         .padding(.horizontal, 16)
                         .padding(.vertical, 8)
            }
            
            
                descView.padding(.vertical, 12)
                
                Divider()
                StartBenchView()
                    .padding(.vertical, 20)
                    .padding(.bottom, 12)
        
                ReportView()
                    .padding(.bottom,24)
                
            }
            
        }

        .scrollIndicators(.hidden)
        .background(.NFLBG)
        .overlay(
            messagesButton.padding(5),
            alignment: .bottomTrailing
        )
        .cornerRadius(32)
        
        .readingFrame{ frame in
            cardFrame = frame} // we apply the cardframe so the image isnt messed up regardless of device, so if im on a ipod or something smaller it isnt super zoomed in
        
    }
    
    private var messagesButton: some View{
       Image(systemName: "circle.fill")
            .foregroundStyle(.nflButtonBlue)
            .font(.system(size: 60))
            .overlay(
                Image(systemName: "message.fill")
                    .foregroundStyle(.nflWhite)
                    .font(.system(size: 30, weight: .medium))
            )
            .onTapGesture {
        
            }
    }
    
    private var headerCell: some View {
        ZStack (alignment: .bottomLeading){
            ImageLoaderView(urlString: "https://static.clubs.nfl.com/image/private/t_new_photo_album/vikings/rfcllx9s7g52gadesbn8.jpg")
            
                
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
    
    private var injurySection: some View{
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
                 //   .shadow(color: .black, radius: 2, x: 0, y: 0)
                    .padding(.horizontal, 5)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                    
                    
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 8)
            .background(.nflBetterblue)
            .cornerRadius(32)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var aboutView: some View{
        VStack(alignment: .leading, spacing: 12){
            VStack(alignment: .leading, spacing: 8){
                sectionTitle(title: "About")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.nflBlack)
                    .padding(.horizontal, 24)
                
                PillGridView(stats: athlete.pills)
                    .padding(10)
            }
        }
    }
    
    private var descView: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "Description")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.nflBlack)
                    .padding(.horizontal, 24)

                Text(description1(for: athlete))
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.nflBlack)
                    .padding(.horizontal, 24)
            }
            .padding(.vertical, 10)
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
    
    private func description1 (for athlete: Athlete) -> String {
        return "Drafted in round \(athlete.draft.round), of the \(athlete.draft.year) NFL Draft, chosen #\(athlete.draft.selection) overall. \(athlete.displayName) is currently a \(athlete.position.abbreviation.rawValue) for the \(athlete.team.displayName.rawValue)."
    }
    
    
}

#Preview {
    CardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
