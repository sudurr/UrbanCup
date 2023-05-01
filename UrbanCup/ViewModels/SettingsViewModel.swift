import SwiftUI
import Combine

class SettingsViewModel: ObservableObject {
    @Published var settings: Settings

    private var cancellables = Set<AnyCancellable>()

    init() {
        self.settings = Settings()

        // Обновляем настройки при изменении значений
        $settings
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] settings in
                self?.settings.team1Name = settings.team1Name
                self?.settings.team2Name = settings.team2Name
                self?.settings.matchDuration = settings.matchDuration
            }
            .store(in: &cancellables)
    }

    deinit {
        cancellables.forEach { $0.cancel() }
    }
}
