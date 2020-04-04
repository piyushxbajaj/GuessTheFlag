//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Piyush Bajaj on 03/04/20.
//  Copyright © 2020 Piyush Bajaj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer =  Int.random(in: 0...2)
    @State private var userScore = 0
//    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack{
            AngularGradient(gradient: Gradient(colors: [.blue,.green,.yellow,.orange,.red,.blue]), center: .top).edgesIgnoringSafeArea(.all)
            
        VStack(spacing: 20){
            VStack{
                Text("Tap the flag of ")
                 
                Text(countries[correctAnswer])
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            ForEach(0 ..< 3){ number in
                Button(action: {
                    //Flag was tapped
                    self.flagTapped(number)
                    
                }){
                    Image(self.countries[number])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black,lineWidth: 1))
                        .shadow(color: .black, radius: 5, x: 3, y: 3)
                    
                }
                
            }
            Text("Current user score is \(self.userScore)")
            Spacer()
            
        }
        }
    .alert(isPresented: $showingScore){
        Alert(title: Text("Score"), message: Text("\(scoreTitle), Your score is \(userScore)"), dismissButton: .default(Text("Continue")){
            self.askQuestion()
        }
        
    )}
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            userScore += 100
        }
        else{
            scoreTitle = "Wrong that's flag of \(countries[number])"
            userScore -= 100
        }
        showingScore = true
    }
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
        
//        ZStack{
//            Color.blue.frame(width: 150, height: 50)
//            Color.purple.edgesIgnoringSafeArea(.all)
//            Color(red: 0.5, green: 0.3, blue: 0.5)
//            LinearGradient(gradient: Gradient(colors: [.red,.orange]), startPoint: .center, endPoint: .bottom).edgesIgnoringSafeArea(.all)
//            RadialGradient(gradient: Gradient(colors: [.red,.black]), center: .bottom, startRadius: 20, endRadius: 200)
//            AngularGradient(gradient: Gradient(colors: [.blue,.green,.yellow,.orange,.red,.blue]), center: .leading)
//            VStack{
//                Text("Hello, World!")
//                Button("Tap me"){
//                    print("Button was tapped")
//
//                }
//                Button(action: {
//                    print("Button was tapped")
//                    self.showingAlert = true
//                }){
//                    HStack(spacing: 10){
//                        Image(systemName: "pencil")
//                            .renderingMode(.original)
//                        Text("Tap meeeeeeeeeeeeee")
//                            .foregroundColor(.black)
//
//
//                    }
//
//                }
//                .alert(isPresented: $showingAlert){
//                    Alert(title: Text("This is swift UI"), message: Text("this is an alert button"), dismissButton: .default(Text("Okayyyyyy")))
//                }
                
                
//            }
            
//        }
        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
