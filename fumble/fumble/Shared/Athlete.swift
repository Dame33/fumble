//
//  Athlete.swift
//  fumble
//
//  Created by Damon Lam on 2025-09-13.
//

import Foundation

struct AthleteArray: Codable {
    let athletes: [Athlete]
    let count, pageIndex, pageSize, pageCount: Int
}

// MARK: - Athlete
struct Athlete: Codable, Identifiable{
    let id, firstName, lastName, displayName: String
    let weight, height, age: Int
    let team: Team
    let jersey: String
    let position: Position
    let draft: Draft
    let status: StatusClass
    let injuries: [Injury]?
    
    
    static var mock1: Athlete{
        Athlete(
            id: "4262921",
            firstName: "Justin",
            lastName: "Jefferson",
            displayName: "Justin Jefferson",
            weight: 195,
            height: 73,
            age: 26,
            team: Team(
                id: "16",
                abbreviation: .min,
                displayName: .minnesotaVikings
            ),
            jersey: "18",
            position: Position(abbreviation: .wr),
            draft: Draft(round: 1, year: 2020, selection: 22),
            status: StatusClass(type: .active),
            injuries: nil
            )
    }
    
    static var mock2: Athlete{
        Athlete(
            id: "4361423",
            firstName: "Micah",
            lastName: "Parsons",
            displayName: "Micah Parsons",
            weight: 250,
            height: 75,
            age: 26,
            team: Team(
                id: "9",
                abbreviation: .gb,
                displayName: .greenBayPackers
            ),
            jersey: "1",
            position: Position(abbreviation: .de),
            draft: Draft(round: 1, year: 2021, selection: 12),
            status: StatusClass(type: .active),
            injuries: nil
            )
    }
    
    static var mock3: Athlete{
        Athlete(
            id: "4361741",
            firstName: "Brock",
            lastName: "Purdy",
            displayName: "Brock Purdy",
            weight: 220,
            height: 73,
            age: 25,
            team: Team(
                id: "25",
                abbreviation: .sf,
                displayName: .sanFrancisco49Ers
            ),
            jersey: "13",
            position: Position(abbreviation: .qb),
            draft: Draft(round: 7, year: 2022, selection: 262),
            status: StatusClass(type: .active),
            injuries: [
                Injury(
                    id: "605348",
                    status: .out,
                    date: "2025-09-12T21:13Z",
                    type: TypeClass(id: "4", description: .out),
                    details: Details(type: "Toe", returnDate: "2025-09-21")
                    )
                ]
            )
            
    }
    
    
    

    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, displayName, weight, height, age, team, jersey, position, draft, status
        case injuries
    }
}

// MARK: - Draft
struct Draft: Codable {
    let round, year, selection: Int
}

// MARK: - Injury
struct Injury: Codable {
    let id: String
    let status: StatusEnum
    let date: String
    let type: TypeClass
    let details: Details
}

// MARK: - Details
struct Details: Codable {
    let type, returnDate: String
}

enum StatusEnum: String, Codable {
    case doubtful = "Doubtful"
    case injuredReserve = "Injured Reserve"
    case out = "Out"
    case questionable = "Questionable"
}

// MARK: - TypeClass
struct TypeClass: Codable {
    let id: String
    let description: Description
}

enum Description: String, Codable {
    case doubtful = "Doubtful"
    case injuryReserve = "Injury reserve"
    case out = "Out"
    case questionable = "Questionable"
}

// MARK: - Position
struct Position: Codable {
    let abbreviation: Abbreviation
    var display: String { abbreviation.rawValue } // returns "DE", "QB", etc.
}

enum Abbreviation: String, Codable {
    case c = "C"
    case cb = "CB"
    case de = "DE"
    case dt = "DT"
    case fb = "FB"
    case g = "G"
    case lb = "LB"
    case ls = "LS"
    case ol = "OL"
    case ot = "OT"
    case p = "P"
    case pk = "PK"
    case qb = "QB"
    case rb = "RB"
    case s = "S"
    case te = "TE"
    case wr = "WR"
}

// MARK: - StatusClass
struct StatusClass: Codable {
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case active = "Active"
    case dayToDay = "Day-to-Day"
    case freeAgent = "Free-Agent"
}

// MARK: - Team
struct Team: Codable {
    let id: String
    let abbreviation: TeamAbbreviation
    let displayName: DisplayName
}

enum TeamAbbreviation: String, Codable {
    case ari = "ARI"
    case atl = "ATL"
    case bal = "BAL"
    case buf = "BUF"
    case car = "CAR"
    case chi = "CHI"
    case cin = "CIN"
    case cle = "CLE"
    case dal = "DAL"
    case den = "DEN"
    case det = "DET"
    case gb = "GB"
    case hou = "HOU"
    case ind = "IND"
    case jax = "JAX"
    case kc = "KC"
    case lac = "LAC"
    case lar = "LAR"
    case lv = "LV"
    case mia = "MIA"
    case min = "MIN"
    case ne = "NE"
    case no = "NO"
    case nyg = "NYG"
    case nyj = "NYJ"
    case phi = "PHI"
    case pit = "PIT"
    case sea = "SEA"
    case sf = "SF"
    case tb = "TB"
    case ten = "TEN"
    case wsh = "WSH"
}

enum DisplayName: String, Codable {
    case arizonaCardinals = "Arizona Cardinals"
    case atlantaFalcons = "Atlanta Falcons"
    case baltimoreRavens = "Baltimore Ravens"
    case buffaloBills = "Buffalo Bills"
    case carolinaPanthers = "Carolina Panthers"
    case chicagoBears = "Chicago Bears"
    case cincinnatiBengals = "Cincinnati Bengals"
    case clevelandBrowns = "Cleveland Browns"
    case dallasCowboys = "Dallas Cowboys"
    case denverBroncos = "Denver Broncos"
    case detroitLions = "Detroit Lions"
    case greenBayPackers = "Green Bay Packers"
    case houstonTexans = "Houston Texans"
    case indianapolisColts = "Indianapolis Colts"
    case jacksonvilleJaguars = "Jacksonville Jaguars"
    case kansasCityChiefs = "Kansas City Chiefs"
    case lasVegasRaiders = "Las Vegas Raiders"
    case losAngelesChargers = "Los Angeles Chargers"
    case losAngelesRams = "Los Angeles Rams"
    case miamiDolphins = "Miami Dolphins"
    case minnesotaVikings = "Minnesota Vikings"
    case newEnglandPatriots = "New England Patriots"
    case newOrleansSaints = "New Orleans Saints"
    case newYorkGiants = "New York Giants"
    case newYorkJets = "New York Jets"
    case philadelphiaEagles = "Philadelphia Eagles"
    case pittsburghSteelers = "Pittsburgh Steelers"
    case sanFrancisco49Ers = "San Francisco 49ers"
    case seattleSeahawks = "Seattle Seahawks"
    case tampaBayBuccaneers = "Tampa Bay Buccaneers"
    case tennesseeTitans = "Tennessee Titans"
    case washingtonCommanders = "Washington Commanders"
}

// MARK: - Athlete Pills Extension
extension Athlete {
    
    var pills: [athletePill] {
        var array: [athletePill] = []
        
        // Weight
        array.append(
            athletePill(emoji: "💪", text: "\(weight) lbs")
        )
        
        // Height
        array.append(
            athletePill(emoji: "📏", text: "\(height) in")
        )
        
        // Position with emoji mapping
        let positionEmoji: String
        switch position.abbreviation {
        case .qb: positionEmoji = "🤽‍♂️"
        case .wr: positionEmoji = "🤾"
        case .rb: positionEmoji = "🏃‍♂️"
        case .pk, .p: positionEmoji = "👟"
        case .c, .g, .ol, .ot, .ls, .fb: positionEmoji = "🤼‍♂️"
        case .cb, .s, .dt, .de, .lb: positionEmoji = "🤼‍♂️"
        default: positionEmoji = "🤾"
        }
        array.append(
            athletePill(emoji: positionEmoji, text: position.abbreviation.rawValue)
        )
        
        // Status
        let statusEmoji: String
        switch status.type {
        case .active: statusEmoji = "✅"
        case .dayToDay, .freeAgent: statusEmoji = "？"
        }
        array.append(
            athletePill(emoji: statusEmoji, text: status.type.rawValue)
        )
        
        // Injury
        let injuryEmoji: String
        if let injuries = injuries, !injuries.isEmpty {
            injuryEmoji = "❌"
        } else {
            injuryEmoji = "✅"
        }
        array.append(
            athletePill(emoji: injuryEmoji, text: injuries?.first?.status.rawValue ?? "Healthy")
        )
        
        // Team
        array.append(
            athletePill(emoji: "🏈", text: team.abbreviation.rawValue)
        )
        
        return array
    }
}
