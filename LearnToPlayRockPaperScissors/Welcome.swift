//
//  Instructions.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        VStack {
            Text("Let's learn to play!")
                .font(.title)
            Spacer()
            Image("rock-paper-scissors")
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
            NavigationLink("Begin Tutorial", destination: TutorialOne())
                .font(.title2)
                .padding(.bottom, 40.0)
            NavigationLink("Skip Tutorial", destination: GameOverview())
                .font(.title3)
                .padding(.bottom, 40.0)
            NavigationLink("Acknowledgements", destination: Acknowledgements())
                .font(.caption)
                .padding(.bottom, 20.0)
        }
        .navigationBarTitle("Rock, Paper, Scissors")
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
        Welcome().environment(\.colorScheme, .dark)
    }
}
