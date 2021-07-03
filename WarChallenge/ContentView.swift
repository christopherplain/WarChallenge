//
//  ContentView.swift
//  WarChallenge
//
//  Created by Christopher Plain on 6/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var playerCard = "card2"
    @State private var cpuCard = "card3"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    func getCardNum() -> Int {
        Int.random(in: 2...14)
    }
    
    func calculateScores(_ playerCardNum: Int, _ cpuCardNum: Int) {
        if playerCardNum > cpuCardNum {
            playerScore += 1
        } else if cpuCardNum > playerCardNum {
            cpuScore += 1
        }
    }

    var body: some View {
        ZStack {
            Image("background")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    let playerCardNum = getCardNum()
                    let cpuCardNum = getCardNum()
                    
                    playerCard = "card\(playerCardNum)"
                    cpuCard = "card\(cpuCardNum)"
                    
                    calculateScores(playerCardNum, cpuCardNum)
                    }, label: {
                    Image("dealbutton")
                })
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text("\(playerScore)")
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text("\(cpuScore)")
                            .font(.largeTitle)
                    }
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
