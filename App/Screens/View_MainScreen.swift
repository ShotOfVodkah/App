//
//  View_MainScreen.swift
//  App
//
//  Created by Александра Грицаенко on 25.03.2024.
//

import SwiftUI

struct View_MainScreen: View {
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Text("Game Name")
                    .padding()
                    .frame(maxWidth: 350)
                    .background(Color("ButtonColor"))
                    .font(.custom("AvenirNext-Bold", size: 38))
                    .border(Color("ButtonBorder"), width: 5)
                    .foregroundStyle(.white)
                    .padding(.bottom, 35)
                
                Button {
                    print("Start")
                } label: {
                    Text("Новая игра")
                        .padding()
                        .frame(maxWidth: 253)
                        .background(Color("ButtonColor"))
                        .font(.custom("AvenirNext-Bold", size: 38))
                        .border(Color("ButtonBorder"), width: 5)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                
                Button {
                    print()
                } label: {
                    Text("Загрузить")
                        .padding()
                        .frame(maxWidth: 253)
                        .background(Color("ButtonColor"))
                        .font(.custom("AvenirNext-Bold", size: 38))
                        .border(Color("ButtonBorder"), width: 5)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                
                Button {
                    print()
                } label: {
                    Text("Настройки")
                        .padding()
                        .frame(maxWidth: 253)
                        .background(Color("ButtonColor"))
                        .font(.custom("AvenirNext-Bold", size: 38))
                        .border(Color("ButtonBorder"), width: 5)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                
                Button {
                    print()
                } label: {
                    Text("Об авторах")
                        .padding()
                        .frame(maxWidth: 253)
                        .background(Color("ButtonColor"))
                        .font(.custom("AvenirNext-Bold", size: 38))
                        .border(Color("ButtonBorder"), width: 5)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                
                Button {
                    print()
                } label: {
                    Text("Выход")
                        .padding()
                        .frame(maxWidth: 253)
                        .background(Color("ButtonColor"))
                        .font(.custom("AvenirNext-Bold", size: 38))
                        .border(Color("ButtonBorder"), width: 5)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
            }
        }
    }
}


#Preview {
    View_MainScreen()
}
