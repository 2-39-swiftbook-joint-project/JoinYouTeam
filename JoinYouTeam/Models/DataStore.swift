//
//  DataStore.swift
//  JoinYouTeam
//
//  Created by nikita on 21.01.24.
//

final class DataStore {
    static let shared = DataStore()
    
    var developers: [Developer] = [
        Developer(name: "TJ Holowaychuk", github: "@visionmedia"),
        Developer(name: "Yo-An Lin", github: "@c9s"),
        Developer(name: "Fabien Potencier", github: "@fabpot", team: nil),
        Developer(name: "Matthew Weier O'Phinney", github: "@weierophinney"),
        Developer(name: "Dane Springmeyer", github: "@springmeyer"),
        Developer(name: "David Cramer", github: "@dcramer", team: nil),
        Developer(name: "Jerome Etienne", github: "@jeromeetienne"),
        Developer(name: "Thibault Duplessis", github: "@ornicar"),
        Developer(name: "Dav Glass", github: "@davglass"),
        Developer(name: "Postmodern", github: "@postmodern"),
        Developer(name: "Nikita", github: "@nikmosyl", team: nil)
    ]
    
    var teams: [Team] = [
        Team(name: "Our Team", projectName: "JoinYourTeam"),
        Team(name: "Apple", projectName: "Swift", projectDescription: "Think Different"),
        Team(
            name: "Golden calf",
            projectName: "Horns and hooves",
            maximumNumberOfDevelopers: 3
        )
    ]
    
    var creators: [Creator] = [
        Creator(
            name: "your name",
            githubAccount: "your github account",
            about: "your tasks"
        ),
        Creator(
            name: "Nikita",
            githubAccount: "@nikmosyl",
            about: "Creator Model, AboutUs Screen, SceneDelegate"
        )
    ]
    
    private init() {}
}


final class StorageManager {
    static let shared = StorageManager()
    private let dataStore = DataStore.shared
    
    private init() {}
    
    func addDeveloper(developer: Developer) -> Bool {
        for item in dataStore.developers {
            if item.github == developer.github {
                return false
            }
        }
        dataStore.developers.append(developer)
        return true
    }
    
    func addTeam(team: Team) -> Bool {
        for item in dataStore.teams {
            if item.name == team.name {
                return false
            }
        }
        dataStore.teams.append(team)
        return true
    }
    
    func getDevelopers() -> [Developer] {
        dataStore.developers
    }
    
    func getDeveloperWith(github: String) -> Developer? {
        for developer in dataStore.developers {
            if developer.github == github {
                return developer
            }
        }
        return nil
    }
    
    func getTeams() -> [Team] {
        dataStore.teams
    }
    
    func getCreators() -> [Creator] {
        dataStore.creators
    }
}


