//
//  ContentView.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Welcome()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().environment(\.colorScheme, .dark)
    }
}
