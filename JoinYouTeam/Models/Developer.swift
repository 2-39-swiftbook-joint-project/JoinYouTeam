//
//  Developer.swift
//  JoinYouTeam
//
//  Created by nikita on 21.01.24.
//

final class Developer {
    let name: String
    let github: String
    weak var team: Team?
    
    init(name: String, github: String, team: Team? = nil) {
        self.name = name
        self.github = github
        self.team = team
    }
}
