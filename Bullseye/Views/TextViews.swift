//
//  TextViews.swift
//  Bullseye
//
//  Created by Александр on 17.06.2021.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabel: View {
    var text: String
    
    var body: some View {
        Text(text)
        .bold()
        .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .font(.caption)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}


struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor)
            .cornerRadius(12.0)
            .foregroundColor(.white)
            
            
    }
}


struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.title3)
    }
}


struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .bold()
            .font(.title3)
    }
}


struct BigBoldText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
    }
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Your Slider value is")
            BigNumberText(text: "999")
            LabelText(text: "Rounds")
            BodyText(text: "Your score is 1000 Points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 100)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()
    }
}
