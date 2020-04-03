//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Piyush Bajaj on 03/04/20.
//  Copyright © 2020 Piyush Bajaj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
//            Color.blue.frame(width: 150, height: 50)
            Color.purple.edgesIgnoringSafeArea(.all)
//            Color(red: 0.5, green: 0.3, blue: 0.5)
            LinearGradient(gradient: Gradient(colors: [.red,.orange]), startPoint: .center, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            Text("Hello, World!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
