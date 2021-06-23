//
//  Shapes.swift
//  Bullseye
//
//  Created by Александр on 21.06.2021.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShapes = false
    
    var body: some View {
        VStack {
            if !wideShapes {
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 20.0)
                    .frame(width: 200.0, height: 100.0)
                    .transition(.scale)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100, height: 100.0)
                .animation(.easeInOut)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100, height: 100.0)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200.0 : 100, height: 100.0)
            Button(action: {
                withAnimation {
                    wideShapes.toggle()
                }
            }) {
                Text("Animate!")
            }

        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
