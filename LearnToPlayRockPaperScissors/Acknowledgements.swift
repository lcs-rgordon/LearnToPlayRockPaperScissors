//
//  Acknowledgements.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct Acknowledgements: View {
    var body: some View {
        VStack {
            Text("File:Rock-paper-scissors.svg by Enzoklop is licensed under CC BY-SA 3.0.\n\nTo view a copy of this license, visit:")
                .padding(.bottom)
            ConditionalLink("Creative Commons", destination: URL(string: "https://creativecommons.org/licenses/by-sa/3.0")!)
            Spacer()
        }
        .padding()
        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
        .navigationBarTitle("Acknowledgements")
    }
}

struct Acknowledgements_Previews: PreviewProvider {
    static var previews: some View {
        Acknowledgements()
    }
}
