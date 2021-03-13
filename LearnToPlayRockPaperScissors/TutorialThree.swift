//
//  TutorialThree.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct TutorialThree: View {
    var body: some View {
        VStack  {
            Tutorial(firstMove: .rock, response: .paper, action: "covers")
            NavigationLink("Next >", destination: GameOverview())
                .font(.title2)
                .padding(.bottom)
        }
        .navigationBarTitle("Tutorial")

    }
}

struct TutorialThree_Previews: PreviewProvider {
    static var previews: some View {
        TutorialThree()
    }
}
