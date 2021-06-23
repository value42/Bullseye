//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Александр on 17.06.2021.
//

import SwiftUI

struct RoundedImageViewsStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(Circle().strokeBorder(Color("StrokeButtonColor"), lineWidth: Constants.General.strokeWidth))
    }
}


struct RoundedImageViewsFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("FilledButtonTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle().fill(Color("FilledButtonBackgoundColor"))
            )
    }
}


struct RoundedTextView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(Circle().strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth))
    }
    
}


struct RoundedRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                        .stroke(lineWidth: Constants.General.strokeWidth)
                        .foregroundColor(Color("StrokeButtonColor")))
            
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10.0){
            RoundedImageViewsStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewsStroked(systemName: "list.dash")
            RoundedImageViewsFilled(systemName: "arrow.counterclockwise")
            RoundedImageViewsFilled(systemName: "list.dash")
            RoundedRectTextView(text: "1000")
            RoundedTextView(text: "1")
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView().preferredColorScheme(.dark)
    }
}
