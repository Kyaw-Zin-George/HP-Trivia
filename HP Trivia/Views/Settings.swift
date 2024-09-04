//
//  Settings.swift
//  HP Trivia
//
//  Created by Kyaw Thant Zin(George) on 9/4/24.
//

import SwiftUI

struct Settings: View {
    @Environment (\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            InfoBackgroundImage()
            VStack{
                Text("Which books would you love to see questions from?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                ScrollView{
                    LazyVGrid(columns: [GridItem(), GridItem()]){
                        //selected item sample
                        ZStack(alignment: .bottomTrailing) {
                            Image("hp1")
                                .resizable()
                                .scaledToFit()
                            .shadow(radius: 7)
                            Image(systemName: "checkmark.circle.fill")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .foregroundStyle(.green)
                                .shadow(radius: 1)
                                .padding(3)
                        }
                        //unselected item sample
                        ZStack(alignment: .bottomTrailing){
                            Image("hp2")
                                .resizable()
                                .scaledToFit()
                            .shadow(radius: 7)
                            .overlay(Rectangle().opacity(0.33))
                            
                            Image(systemName: "circle")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .foregroundStyle(.green.opacity(0.5))
                                .shadow(radius: 1)
                                .padding(3)
                            
                        }
                        //locked book sample
                        ZStack(alignment: .center){
                            Image("hp3")
                                .resizable()
                                .scaledToFit()
                            .shadow(radius: 7)
                            .overlay(Rectangle().opacity(0.75))
                            
                            Image(systemName: "lock.fill")
                                .font(.largeTitle)
                                .imageScale(.large)
                                .foregroundStyle(.black)
                                .shadow(color: .white .opacity(0.75), radius: 1)
                                .padding(3)
                            
                        }
                    }.padding()
                    
                }
                
                //Button
                Button("Done"){
                    dismiss()
                }.doneButton()
            }.foregroundStyle(.black)
        }
    }
}

#Preview {
    Settings()
}
