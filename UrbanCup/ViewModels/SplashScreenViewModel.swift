import SwiftUI
import Combine

class SplashScreenViewModel: ObservableObject {
    private var cancellable: AnyCancellable?

    func navigateAfterDelay(_ delay: TimeInterval, completion: @escaping () -> Void) {
        cancellable = Just(())
            .delay(for: .seconds(delay), scheduler: RunLoop.main)
            .sink { _ in
                completion()
            }
    }

    deinit {
        cancellable?.cancel()
    }
}
