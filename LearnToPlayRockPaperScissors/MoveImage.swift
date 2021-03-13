//
//  MoveImage.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct MoveImage: View {
    
    var move: Move = .rock
    
    var body: some View {
        Image(move.rawValue)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .padding(.all, -5)
            .overlay(Circle().stroke(Color.primary, lineWidth: 4).padding(.all, -4))
            .shadow(color: Color.primary, radius: 6)
            .padding(.horizontal, 15)
    }
}

struct MoveImage_Previews: PreviewProvider {
    static var previews: some View {
        MoveImage()
        MoveImage().environment(\.colorScheme, .dark)
    }
}
