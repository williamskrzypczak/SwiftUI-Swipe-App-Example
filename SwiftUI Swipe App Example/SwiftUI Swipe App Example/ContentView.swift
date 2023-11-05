//
//  ContentView.swift
//  SwiftUI Swipe App Example
//
//  Created by Bill Skrzypczak on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    
    // Step 1 Define a data source
    //
    private var instrument: [String] = ["Fender", "Gibson", "Yamaha", "PRS", "Gretch", "Ibanez"].reversed()
    
    // Iterate thru the data source
    //
    var body: some View {
        VStack {
            ZStack {
                ForEach(instrument, id: \.self) { guitar in CardView(guitar: guitar)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
