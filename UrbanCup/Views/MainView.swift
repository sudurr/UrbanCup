import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Text(viewModel.settings.team1Name)
                            .font(.title)
                        Text("\(viewModel.team1Score)")
                            .font(.largeTitle)
                        HStack {
                            Button(action: { viewModel.incrementScore(for: 1) }) {
                                Text("+")
                                    .font(.title)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }
                            Button(action: { viewModel.decrementScore(for: 1) }) {
                                Text("-")
                                    .font(.title)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    Spacer()
                    VStack {
                        Text(viewModel.settings.team2Name)
                            .font(.title)
                        Text("\(viewModel.team2Score)")
                            .font(.largeTitle)
                        HStack {
                            Button(action: { viewModel.incrementScore(for: 2) }) {
                                Text("+")
                                    .font(.title)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }
                            Button(action: { viewModel.decrementScore(for: 2) }) {
                                Text("-")
                                    .font(.title)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
                .padding()

                Text(viewModel.timerModel.timeString)
                    .font(.system(size: 70, design: .monospaced))

                HStack {
                    Button(action: {
                        viewModel.timerModel.isRunning ? viewModel.timerModel.stopTimer() : viewModel.timerModel.startTimer()
                    }) {
                        Text(viewModel.timerModel.isRunning ? "Pause" : "Start")
                            .padding(.horizontal, 40)
                            .padding(.vertical, 20)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .font(.title)
                            .cornerRadius(10)
                    }

                    Button(action: {
                        viewModel.timerModel.resetTimer()
                        viewModel.resetScore()
                    }) {
                        Text("Reset")
                            .padding(.horizontal, 40)
                            .padding(.vertical, 20)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .font(.title)
                            .cornerRadius(10)
                    }
                }
                .padding(.top)

                Spacer()
            }
            .navigationBarTitle("Urban Cup")
            .navigationBarItems(trailing: NavigationLink(destination: SettingsView()) {
                Image(systemName: "gear")
                    .font(.title)
            })
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

