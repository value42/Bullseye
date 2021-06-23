//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Александр on 17.06.2021.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        VStack {
            TopView(game: $game, alertIsVisible: $alertIsVisible)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    @Binding var alertIsVisible: Bool
    @State private var leaderboardIsShowing = false
    
    var body: some View {
        HStack{
            Button(action: {
                game.restart()
                withAnimation {
                    alertIsVisible = false
                }
            }) {
                RoundedImageViewsStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                leaderboardIsShowing = true
            }) {
                RoundedImageViewsFilled(systemName: "list.dash")
            }.sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
                LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
            })
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    var body: some View {
        VStack(spacing: 5.0) {
            LabelText(text: title)
            RoundedRectTextView(text: text)
        }
    }
    
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill( RadialGradient(gradient: Gradient(colors: [Color("RingColor").opacity(0.8 * opacity), Color("RingColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300) )
                    .frame(width: size, height:  size)
                    
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    
    static var previews: some View {
        BackgroundView(game: .constant(Game()), alertIsVisible: alertIsVisible)
        BackgroundView(game: .constant(Game()), alertIsVisible: alertIsVisible).preferredColorScheme(.dark)
    }
}
