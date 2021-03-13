//
//  ConditionalLink.swift
//  LearnToPlayRockPaperScissors
//
//  Created by Russell Gordon on 2020-07-28.
//

import SwiftUI

struct ConditionalLink: View {
    
    var text: String
    var destination: URL
    
    init(_ text: String, destination: URL) {
        self.text = text
        self.destination = destination
    }
    
    var body: some View {
        #if SDK_iOS_14
        if #available(iOS 14, *) {
            Link(text, destination: destination)
        } else {
            Text(destination.absoluteString)
        }
        #else
            Text(destination.absoluteString)
        #endif
    }
}

struct ConditionalLink_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalLink("Apple", destination: URL(string: "https://www.apple.com")!).previewDevice("iPhone SE")
        ConditionalLink("Apple", destination: URL(string: "https://www.apple.com")!).previewDevice("iPhone 11 Pro (13.5)")
    }
}
