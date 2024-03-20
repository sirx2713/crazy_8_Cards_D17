//
//  ContentView.swift
//  crazy_8_Cards_D17
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/18.
//

import SwiftUI

struct GameView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var backGround = "background2"
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image(backGround)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Image("logo")
                    Spacer()
                    HStack{
                        Spacer()
                        Image(playerCard)
                        Spacer()
                        Image(cpuCard)
                        Spacer()
                    }
                    Spacer()
                    Button(action: {
                        deal()
                    }, label: {
                        Image("button")
                    })
                    Spacer()
                    HStack{
                        Spacer()
                        VStack{
                            Text("Player")
                                .font(.headline)
                                .padding(.bottom)
                            
                            Text(String(playerScore))
                                .scaleEffect(2)
                                .font(.largeTitle)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        Spacer()
                        VStack{
                            Text("CPU")
                                .font(.headline)
                                .padding(.bottom)
                            Text(String(cpuScore))
                                .scaleEffect(2)
                                .font(.largeTitle)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        Spacer()
                        
                    }.foregroundColor(.white)
                    
                    Spacer()
                    HStack{
                        Spacer()
                        VStack{
                            NavigationLink {
                                HomeView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                VStack {
                                    Image(systemName: "play.house.fill")
                                    Text("Home")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                    
                                }
                            }
                        }
                        Spacer()
                        VStack{
                            Button(action: {
                                back()
                            }, label: {
                                VStack {
                                    Image(systemName: "person.and.background.striped.horizontal")
                                    Text("Change Background")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                }
                                
                            })
                            
                        }
                        Spacer()
                        VStack{
                            Button(action: {
                                reset()
                            }, label: {
                                VStack {
                                    Image(systemName: "memories")
                                    Text("Restart")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                    
                                }
                                
                            })
                            
                        }
                        Spacer()
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
            }
        }
    }
    
    func deal(){
        
        //Randomise the player cards
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        //Randomise the cpu cards
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        //Add 4 to player card
        if playerCard > cpuCard {
            playerScore += 4
        }
        
        //Add 4 to cpu score
        if cpuCard > playerCard {
            cpuScore += 4
        }
        
        //Add 1 to both is it is a tie
        else if playerCard == cpuCard{
            playerScore += 1
            cpuScore += 1
        }
        
    }
    
    func back(){
        
        //Randomise the background
        let backGroundValue = Int.random(in: 1...4)
        backGround = "background" + String(backGroundValue)
    }
    func reset(){
        
        //Reset the game to default
        playerScore = 0
        cpuScore = 0
        playerCard  = "back"
        cpuCard = "back"
        backGround = "background2"
    }
}

#Preview {
    GameView()
}
