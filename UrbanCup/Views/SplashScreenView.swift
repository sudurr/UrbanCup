import SwiftUI

struct SplashScreenView: View {
    @StateObject private var viewModel = SplashScreenViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var moveToMainView = false

    var body: some View {
        VStack {
            Spacer()
            Text("Urban Cup")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            Spacer()
        }
        .onAppear {
            viewModel.navigateAfterDelay(3.0) {
                moveToMainView = true
            }
        }
        .fullScreenCover(isPresented: $moveToMainView) {
            MainView()
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
