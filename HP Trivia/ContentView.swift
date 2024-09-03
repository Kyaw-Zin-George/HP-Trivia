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
                
                VStack{
                    VStack{
                        Image(systemName: "bolt.fill")
                            .font(.largeTitle)
                            .imageScale(.large)
                        
                        Text("HP")
                            .font(.custom(Constant.hpFont,size: 70))
                        //to get closer to hp and trivia
                            .padding(.bottom, -50)
                        Text("Trivia")
                            .font(.custom(Constant.hpFont, size: 60))
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
