//
//  FootballResponse.swift
//  FootballTeams
//
//  Created by Lesley Lopez on 8/15/24.
//

import Foundation

struct FootballResponse: Codable {

    var teams: [Team]
}

struct Team: Codable, Identifiable {
  
    var id: Int
    var name: String
}

