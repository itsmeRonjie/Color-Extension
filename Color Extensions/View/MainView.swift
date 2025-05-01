//
//  ContentView.swift
//  Color Extensions
//
//  Created by Ronjie Diafante Man-on on 5/1/25.
//

import SwiftUI

struct MainView: View {
    @State var rectangleColors: [Color] = [
        .maroon,
        .cadetBlue,
        .brown1,
        .greenYellow,
        .crimson,
        .orange1,
        .tomato,
        .coral,
        .darkCyan
    ]
    
    @State var textColor: Color = .deepSkyBlue
    @State var bgColor: Color = .black
    
    var body: some View {
        VStack {
            
            
            Spacer()
            
            Grid {
                ColorRow(
                    rectangleColors: rectangleColors,
                    lower: 0,
                    upper: 3,
                    dim: 75,
                    radius: 10)
                
                ColorRow(
                    rectangleColors: rectangleColors,
                    lower: 3,
                    upper: 6,
                    dim: 75,
                    radius: 10)
                
                ColorRow(
                    rectangleColors: rectangleColors,
                    lower: 6,
                    upper: 9,
                    dim: 75,
                    radius: 10)
            }
            
            Spacer()
            
            Button(action: {
                rectangleColors = Color
                    .randomColorsN(n: rectangleColors.count)
            }, label: {
                Text("Random Colors")
                    .foregroundColor(textColor)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(bgColor)
                    )
                
            })
            
            
        }
        .padding()
    }
}

struct ColorRow: View {
    let rectangleColors: [Color]
    let lower: Int
    let upper: Int
    
    let dim: CGFloat
    let radius: CGFloat
    
    var body: some View {
        GridRow {
            ForEach(lower ..< upper, id: \.self) { i in
                RectColor(
                    color: rectangleColors[i],
                    dim: dim,
                    radius: radius)
            }
        }
    }
}

struct RectColor: View {
    let color: Color
    let dim: CGFloat
    let radius: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: radius)
            .fill(color)
            .frame(width: dim, height: dim)
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke()
            )
    }
}

#Preview {
    MainView()
}
