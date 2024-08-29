//
//  ContentView.swift
//  TestingMVVM
//
//  Created by Conner Yoon on 8/29/24.
//

import SwiftUI
import SwiftUI

// MARK: - Model
class GameModel {
    var playerScore: Int
    var highScore: Int
    
    init(playerScore: Int = 0, highScore: Int = 0) {
        self.playerScore = playerScore
        self.highScore = highScore
    }
    
    func updateScore(by points: Int) {
        playerScore += points
        if playerScore > highScore {
            highScore = playerScore
        }
    }
    
    func resetScore() {
        playerScore = 0
    }
}

// MARK: - ViewModel
class GameViewModel: ObservableObject {
    @Published var showView: ChosenView
    @Published var model: GameModel
    
    init(showView: ChosenView = .mainMenu, model: GameModel = GameModel()) {
        self.showView = showView
        self.model = model
    }
    
    func navigateToPlayView() {
        showView = .play
    }
    
    func navigateToMenuView() {
        showView = .mainMenu
    }
    
    func addPoints() {
        model.updateScore(by: 10) // Adds 10 points to the player's score
    }
    
    func resetGame() {
        model.resetScore()
        navigateToMenuView()
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
            Text("High Score: \(viewModel.model.highScore)")
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
            Text("Score: \(viewModel.model.playerScore)")
            Button("Fun") {
                viewModel.addPoints()
            }
            Button("All done?") {
                viewModel.resetGame()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    GameView()
}
