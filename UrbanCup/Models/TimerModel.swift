import Foundation
import Combine

class TimerModel: ObservableObject {
    @Published var timeRemaining: TimeInterval
    @Published var isRunning = false

    var matchDuration: TimeInterval {
        didSet {
            resetTimer()
        }
    }

    private var cancellable: AnyCancellable?

    init(matchDuration: TimeInterval) {
        self.matchDuration = matchDuration
        self.timeRemaining = matchDuration
    }

    func startTimer() {
        if !isRunning {
            isRunning = true
            let startDate = Date()

            cancellable = Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .sink { [weak self] _ in
                    guard let self = self else { return }
                    let elapsed = Date().timeIntervalSince(startDate)
                    self.timeRemaining = max(0, self.matchDuration - elapsed)
                    if self.timeRemaining == 0 {
                        self.stopTimer()
                    }
                }
        }
    }

    func stopTimer() {
        isRunning = false
        cancellable?.cancel()
    }

    func resetTimer() {
        stopTimer()
        timeRemaining = matchDuration
    }

    var timeString: String {
        let minutes = Int(timeRemaining / 60)
        let seconds = Int(timeRemaining.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
