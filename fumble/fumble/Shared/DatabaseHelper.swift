//
//  DatabaseHelper.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import Foundation

struct DatabaseHelper {
    func getAthlete() async throws -> [Athlete] {
        guard let url = URL(string: "INSERT ESPN API URL HERE") else{
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let athletes = try JSONDecoder().decode(AthleteArray.self, from: data) // get athletes from JSON into Athlete Array
        return athletes.athletes
    
    }
}
