//
//  ContentView.swift
//  TicTacToe
//
//  Created by Arpan Tyagi on 11.12.2021.
//

import SwiftUI



struct ContentView: View {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),]
    
    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isHumanTurn = true
    
    var body: some View {
        
        GeometryReader{ geometry in
            
            VStack{
                Spacer()
                LazyVGrid(columns: columns, spacing: 15){
                    ForEach(0..<9) { i in
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.green)
                                .opacity(0.6)
                                .frame(width: geometry.size.width/3 - 15 ,
                                       height: geometry.size.width/3 - 15)
                                
                            Image(systemName: moves[i]? .indicator ?? "")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        }
                        .onTapGesture {
                            moves[i] = Move(player: isHumanTurn ? .human: .computer, boardIndex: i)
                            isHumanTurn.toggle()
                            
                        }
                    }
                }
                Spacer()
            }
            
        }
    }
}

enum Player{
    case human, computer
}

struct Move{
    let player: Player
    let boardIndex: Int

    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
