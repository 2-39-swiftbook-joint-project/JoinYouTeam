//
//  Team.swift
//  JoinYouTeam
//
//  Created by nikita on 21.01.24.
//

final class Team {
    let name: String
    let projectName: String
    let projectDescription: String
    let maximumNumberOfDevelopers: Int?
    let developers: [Developer] = []
    
    init(
        name: String,
        projectName: String,
        projectDescription: String,
        maximumNumberOfDevelopers: Int? = nil,
        developers: [Developer]
    ) {
        self.name = name
        self.projectName = projectName
        self.projectDescription = projectDescription
        self.maximumNumberOfDevelopers = maximumNumberOfDevelopers
    }
}
