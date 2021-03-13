//
//  ShowScore.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct ShowScore: View {
    
    var of: Int = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Your score:")
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .padding(.top)
            Text("\(of)")
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .foregroundColor(.primary)
    }
    
}

struct ShowScore_Previews: PreviewProvider {
    static var previews: some View {
        ShowScore()
    }
}
