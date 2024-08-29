//
//  ContentView.swift
//  TestingMVVM
//
//  Created by Conner Yoon on 8/29/24.
//

import SwiftUI
import SwiftUI

// MARK: - ViewModel
class GameViewModel: ObservableObject {
    @Published var showView: ChosenView
    
    init(showView: ChosenView = .mainMenu) {
        self.showView = showView
    }
    
    func navigateToPlayView() {
        showView = .play
    }
    
    func navigateToMenuView() {
        showView = .mainMenu
    }
}

// MARK: - Enum
enum ChosenView {
    case mainMenu, play
}

// MARK: - Views
struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.showView {
            case .mainMenu:
                MenuView(viewModel: viewModel)
            case .play:
                PlayView(viewModel: viewModel)
            }
        }
    }
}

struct MenuView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            Text("Hello world")
            Button("Wanna play?") {
                viewModel.navigateToPlayView()
            }
        }
    }
}

struct PlayView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            Text("This is so fun. Press button to have fun.")
            Button("Fun") {
                // Add fun action here
            }
            Button("All done?") {
                viewModel.navigateToMenuView()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    GameView()
}
