//
//  HomeView.swift
//  crazy_8_Cards_D17
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/18.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{ ZStack {
            Image("background2")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                    .scaleEffect(2)
                Spacer()
                NavigationLink {
                    GameView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Image("play")
                }
                Spacer()
            }
        }
    }
        
    }
}

#Preview {
    HomeView()
}
