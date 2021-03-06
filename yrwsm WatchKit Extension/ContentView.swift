//
//  ContentView.swift
//  yrwsm WatchKit Extension
//
//  Created by Fabian Kropfhamer on 19.01.22.
//

import SwiftUI

struct ContentView: View {
    @State private var text = getText()
    
    var body: some View {
        VStack {
            Text(text.toString())
                .multilineTextAlignment(.center)
            
        }.onTapGesture {
            newText()
        }
    }
    
    func newText() {
        text = getText()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
