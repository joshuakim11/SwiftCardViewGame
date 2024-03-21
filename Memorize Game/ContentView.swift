//
//  ContentView.swift
//  Memorize Game
//
//  Created by Joshua Kim on 3/16/24.
//

import SwiftUI

//Constants
let letters = ["a","b","c","d","e","f","g","h","i"]
let numbers = ["1","2","3","4","5","6","7","8","9"]
let emojis = ["🤣","😙","😎","🤪","🥰","🥹","🤮","🤡","👹"]

struct ContentView: View {
    @State var themeLength = 0
    @State var theme: [String] = []
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], content: {
                        ForEach(0..<themeLength, id: \.self) { index in
                            card(content: theme[index])
                            card(content: theme[index])
                        }
                        .aspectRatio(5/6, contentMode: .fit)
                    })
                    .foregroundColor(.orange)
                    
                }
            }
            .padding(.vertical, 70)
            .padding(.horizontal,15.0)
            VStack {
                Text("Memorize Game")
                    .font(.system(size: 30))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .underline()
                Spacer()
                HStack {
                    emojiTheme
                    Spacer()
                    numberTheme
                    Spacer()
                    letterTheme
                }
                .font(.system(size: 25))
            }
            .padding()
        }
    }
    
    struct card: View {
        @State var isFaceUp: Bool = false
        let content: String
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 25)
                if isFaceUp {
                    base.fill(.white)
                        .strokeBorder(lineWidth: 3)
                        .foregroundColor(.orange)
                    Text(content)
                } else {
                    base.fill()
                }
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
    
    func buttonLogic(buttonTheme: [String], symb: String) -> some View {
        Button(action: {
            themeLength = buttonTheme.count
            theme = buttonTheme
        }, label: {
            Image(systemName: symb)
        })
    }
    
    var emojiTheme: some View {
        buttonLogic(buttonTheme: emojis, symb: "smiley")
    }
    
    var numberTheme: some View {
        buttonLogic(buttonTheme: numbers, symb: "list.number")
    }
    
    var letterTheme: some View {
        buttonLogic(buttonTheme: letters, symb: "keyboard.fill")
    }
}

#Preview {
    ContentView()
}
