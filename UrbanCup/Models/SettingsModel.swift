import Foundation

struct Settings: Codable {
    var team1Name: String
    var team2Name: String
    var matchDuration: Int

    init() {
        team1Name = UserDefaults.standard.string(forKey: "team1Name") ?? "Team 1"
        team2Name = UserDefaults.standard.string(forKey: "team2Name") ?? "Team 2"
        matchDuration = UserDefaults.standard.integer(forKey: "matchDuration")

        if matchDuration == 0 {
            matchDuration = 30
        }
    }

    func save(_ key: String, value: Any) {
        UserDefaults.standard.set(value, forKey: key)
    }
}
