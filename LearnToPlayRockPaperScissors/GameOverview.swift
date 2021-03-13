//
//  GameOverview.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct GameOverview: View {
    var body: some View {
        VStack  {
            Text("In this game, you'll learn how to play Rock, Paper, Scissors.\n\nThe computer will make a move – one of rock, paper, or scissors.\n\nYou'll be quizzed to select the move that will result in a loss or a win.\n\nMake the correct selection: gain a point!\n\nMake the wrong choice: lose a point.")
                .font(.title2)
                .padding(.top, 20.0)
                .padding(.horizontal)
                .minimumScaleFactor(0.9)
            Spacer()
            NavigationLink("Let's play!", destination: Quiz())
                .font(.title2)
                .padding(.bottom)

        }
        .navigationBarTitle("Game Overview")
    }
}

struct GameOverview_Previews: PreviewProvider {
    static var previews: some View {
        GameOverview()
    }
}
