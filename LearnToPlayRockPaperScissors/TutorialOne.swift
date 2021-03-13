//
//  TutorialOne.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct TutorialOne: View {
    var body: some View {
        VStack  {
            Tutorial(firstMove: .scissors, response: .rock, action: "smashes")
            NavigationLink("Next >", destination: TutorialTwo())
                .font(.title2)
                .padding(.bottom)

        }
        .navigationBarTitle("Tutorial")
    }
}

struct TutorialOne_Previews: PreviewProvider {
    static var previews: some View {
        TutorialOne()
    }
}
