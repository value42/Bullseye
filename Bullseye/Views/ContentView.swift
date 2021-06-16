//
//  ContentView.swift
//  Bullseye
//
//  Created by Александр on 15.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            Text(String(game.target))
                .kerning(-1.0)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                .bold()
            }
            Button(action: {
                alertIsVisible = true
            }) {
                Text("Hit me")
            }
            .alert(isPresented: $alertIsVisible,
                   content: {
                    let roundedValue = Int(sliderValue.rounded())
                    return Alert(title: Text("Hello there!"), message: Text("Your score is \(roundedValue).\n" + "Your score is \(game.points(sliderValue: roundedValue))"), dismissButton: .default(Text("Awesome!")))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
