//
//  Team.swift
//  JoinYouTeam
//
//  Created by nikita on 21.01.24.
//

final class Team {
    let name: String
    let projectName: String
    var projectDescription: String?
    let maximumNumberOfDevelopers: Int?
    var developers: [Developer] = []
    
    init(
        name: String,
        projectName: String,
        projectDescription: String? = nil,
        maximumNumberOfDevelopers: Int? = nil
    ) {
        self.name = name
        self.projectName = projectName
        self.projectDescription = projectDescription
        self.maximumNumberOfDevelopers = maximumNumberOfDevelopers
    }
}
