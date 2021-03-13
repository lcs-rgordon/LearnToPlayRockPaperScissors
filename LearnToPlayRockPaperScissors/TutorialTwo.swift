//
//  TutorialTwo.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct TutorialTwo: View {
    var body: some View {
        VStack  {
            Tutorial(firstMove: .paper, response: .scissors, action: "cut")
            NavigationLink("Next >", destination: TutorialThree())
                .font(.title2)
                .padding(.bottom)
        }
        .navigationBarTitle("Tutorial")

    }
}

struct TutorialTwo_Previews: PreviewProvider {
    static var previews: some View {
        TutorialTwo()
    }
}
