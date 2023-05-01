import Foundation
import Combine

class MainViewModel: ObservableObject {
    @Published var settings = Settings() {
        didSet {
            updateTimerModel()
        }
    }
    @Published var timerModel: TimerModel
    @Published var team1Score = 0
    @Published var team2Score = 0

    init() {
        // Инициализируем TimerModel с длительностью матча по умолчанию
        timerModel = TimerModel(matchDuration: TimeInterval(30 * 60))
        
        // Обновляем TimerModel с текущей длительностью матча из настроек
        updateTimerModel()
    }

    private func updateTimerModel() {
        timerModel.matchDuration = TimeInterval(settings.matchDuration * 60)
    }

    func incrementScore(for team: Int) {
        if team == 1 {
            team1Score += 1
        } else if team == 2 {
            team2Score += 1
        }
    }

    func decrementScore(for team: Int) {
        if team == 1 && team1Score > 0 {
            team1Score -= 1
        } else if team == 2 && team2Score > 0 {
            team2Score -= 1
        }
    }

    func resetScore() {
        team1Score = 0
        team2Score = 0
    }
}
