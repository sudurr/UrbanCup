import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Team Names")) {
                    TextField("Team 1", text: $viewModel.settings.team1Name)
                    TextField("Team 2", text: $viewModel.settings.team2Name)
                }

                Section(header: Text("Match Duration")) {
                    Stepper(value: $viewModel.settings.matchDuration, in: 1...180) {
                        Text("\(viewModel.settings.matchDuration) minutes")
                    }
                }

                Button(action: saveSettings) {
                    Text("Save")
                        .foregroundColor(.blue)
                }
            }
            .navigationBarTitle("Settings")
        }
    }

    private func saveSettings() {
        viewModel.settings.save("team1Name", value: viewModel.settings.team1Name)
        viewModel.settings.save("team2Name", value: viewModel.settings.team2Name)
        viewModel.settings.save("matchDuration", value: viewModel.settings.matchDuration)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
