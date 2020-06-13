//
//  ContentView.swift
//  SwiftUIMenuBar
//
//  Created by Felix Pojtinger on 13.06.20.
//  Copyright © 2020 Felix Pojtinger. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Add Todo") {
                print("Clicked")
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
