//
//  View_Authors.swift
//  App
//
//  Created by Александра Грицаенко on 25.03.2024.
//

import SwiftUI

struct View_Authors: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack() {
                Text("Об авторах")
                    .padding()
                    .frame(maxWidth: 350)
                    .background(Color("ButtonColor"))
                    .font(.custom("AvenirNext-Bold", size: 38))
                    .border(Color("ButtonBorder"), width: 5)
                    .foregroundStyle(.white)
                    .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    View_Authors()
}
