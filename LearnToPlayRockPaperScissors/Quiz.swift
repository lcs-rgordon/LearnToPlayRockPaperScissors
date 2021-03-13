//
//  Quiz.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct Quiz: View {
    
    @State private var moves: [Move] = [.rock, .paper, .scissors]
    @State private var move = Int.random(in: 0...2)
    @State private var lastComputerMove: Move = .rock
    @State private var goalIsToWin: Bool = Bool.random()
    @State private var currentScore: Int = 0
    @State private var showFeedback = false
    @State private var result = ""
    @State private var feedback = ""
    @State private var currentRound = 1
    
    // Number of rounds
    private let maxRounds = 10
    
    // For feedback to user
    @State private var encouragementPhrases = ["Great work!",
                                               "Nicely done.",
                                               "Way to go!",
                                               "That's awesome!",
                                               "Terrific!",
                                               "Lovely!",
                                               "Amazing!"
    ]
    
    // Randomly select an encouragement phrase but ensure it is not the same as last time
    @State private var lastEncouragementIndex = 0
    private var newEncouragementPhrase: String {
        
        // The index of the new encouragement phrase
        var newIndex: Int
        
        // Loop until a different index is selected
        repeat {
            newIndex = Int.random(in: 0..<encouragementPhrases.count)
        } while newIndex == lastEncouragementIndex
        
        // Save the selected index
        lastEncouragementIndex = newIndex
        
        // Return the unique encouragement phrase
        return encouragementPhrases[newIndex]
        
    }
    
    private var goal: String {
        return goalIsToWin ? "win" : "lose"
    }
    
    var body: some View {
        VStack {
            Text("The computer chose: ")
            Image("\(moves[move])")
                .resizable()
                .scaledToFit()
            Text("You'd make what move to")
            Text(goal)
                .fontWeight(.bold)
                .padding(.vertical, 5)
            Text("this round?")
            HStack {
                // All the moves besides the one selected
                ForEach(moves.filter({ currentMove in
                    
                    currentMove != moves[move]
                    
                }), id: \.self) { userResponseMove in
                    
                    Button(action: {
                        // A move has been tapped
                        checkWhetherCorrect(for: userResponseMove)
                        
                        // Trigger the alert to provide feedback
                        showFeedback = true
                    },
                    label: {
                        MoveImage(move: userResponseMove)
                    })
                    
                }
            }
            .alert(isPresented: $showFeedback) {
                
                return Alert(title: Text(result),
                             message: Text(feedback),
                             dismissButton: .default(Text("\(currentRound < maxRounds ? "Continue" : "Play Again")")) {
                                
                                if currentRound < maxRounds {
                                    nextQuestion()
                                } else {
                                    playAgain()
                                }
                                
                             })
                    
            }
            ShowScore(of: currentScore)
                .padding(.bottom)
            
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .multilineTextAlignment(.center)
        .navigationBarTitle("Quiz")
    }
    
    // Play again
    func nextQuestion() {
        
        // Increase the round
        currentRound += 1
        
        // The new correct answer
        var newComputerMove: Move
        
        // Keep selecting a new computer move until it's different than the last time
        repeat {
            move = Int.random(in: 0...2)
            newComputerMove = moves[move]
        } while newComputerMove == lastComputerMove

        // Whether goal is to win or not
        goalIsToWin = Bool.random()
        
    }
    
    func playAgain() {
        result = ""
        feedback = ""
        currentScore = 0
        currentRound = 1
    }
    
    func correct() {
        result = "Correct"
        currentScore += 1
        feedback = newEncouragementPhrase
    }
    
    func wrong(shouldHavePicked this: Move) {
        result = "Wrong"
        currentScore -= 1
        feedback = "Oops, you should have picked \(this.rawValue) to \(goal)."
    }
    
    // Check to see if the correct flag was tapped
    func checkWhetherCorrect(for userMove: Move) {
        
        // Shortcut to refer to computer's move
        let computerMove = moves[move]
        
        // Keep track of the computer's move
        lastComputerMove = computerMove
        
        // Check the answer provided
        if goalIsToWin {
            switch computerMove {
            case .scissors:
                if userMove == .rock {
                    correct()
                } else {
                    wrong(shouldHavePicked: .rock)
                }
            case .paper:
                if userMove == .scissors {
                    correct()
                } else {
                    wrong(shouldHavePicked: .scissors)
                }
            case .rock:
                if userMove == .paper {
                    correct()
                } else {
                    wrong(shouldHavePicked: .paper)
                }
            }
            
        } else { // Goal is to lose...
            
            switch computerMove {
            case .scissors:
                if userMove == .paper {
                    correct()
                } else {
                    wrong(shouldHavePicked: .paper)
                }
            case .paper:
                if userMove == .rock {
                    correct()
                } else {
                    wrong(shouldHavePicked: .rock)
                }
            case .rock:
                if userMove == .scissors {
                    correct()
                } else {
                    wrong(shouldHavePicked: .scissors)
                }
            }
            
        }
        
        // When on final round, add a bit more feedback
        if currentRound == maxRounds {
            feedback = "\(feedback)\n\nYour final score is \(currentScore), having answered \(maxRounds - (maxRounds - currentScore) / 2) / \(maxRounds) questions correctly."
        }
        
    }
    
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz()
    }
}
