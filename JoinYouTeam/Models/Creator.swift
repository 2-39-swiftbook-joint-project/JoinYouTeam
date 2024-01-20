//
//  Creator.swift
//  JoinYouTeam
//
//  Created by nikita on 03.01.24.
//

struct Creator {
    let name: String
    let githubAccount: String
    let about: String
    
    static func getCreatorsList() -> [Creator] {
         [
            Creator(
                name: "Nikita",
                githubAccount: "@nikmosyl",
                about: "Creator Model, AboutUs Screen, SceneDelegate"
            ),
            Creator(
                name: "your name",
                githubAccount: "your github account",
                about: "your tasks"
            )
         ]
        
    }
}
