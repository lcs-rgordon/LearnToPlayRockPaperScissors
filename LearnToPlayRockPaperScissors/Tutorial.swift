//
//  Tutorial.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct Tutorial: View {
    
    var firstMove: Move = .scissors
    var response: Move = .rock
    var action: String = "smashes"
    
    var body: some View {
        VStack {
            Text("This is \(firstMove.rawValue.capitalized):")
                .padding(.top, 20.0)
            Image("\(firstMove.rawValue)")
                .resizable()
                .scaledToFit()
            Text("To beat this, play the \(response.rawValue.capitalized):")
            Image("\(response.rawValue)")
                .resizable()
                .scaledToFit()
            Text("\(response.rawValue.capitalized) \(action) the \(firstMove.rawValue.capitalized)!")
                .padding(.bottom, 20.0)

            Spacer()
        }
        .multilineTextAlignment(.center)
        .font(.title)
    }
}

struct Tutorial_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial()
    }
}
