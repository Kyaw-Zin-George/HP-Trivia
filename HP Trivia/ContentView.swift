//
//  ContentView.swift
//  HP Trivia
//
//  Created by Kyaw Thant Zin(George) on 8/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
