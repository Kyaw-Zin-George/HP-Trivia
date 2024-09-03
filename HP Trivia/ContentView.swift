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
                    }.padding(.top, 70)
                    
                    Spacer()
                    
                    VStack{
                        Text("Recent Scores:")
                            .font(.title2)
                        Text("33")
                        Text("53")
                        Text("20")
                    }
                    .font(.title3)
                    .padding(.horizontal)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.7))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Button{
                            //
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                        }
                        
                        Spacer()
                        
                        Button{
                            
                        }label: {
                            Text("Play")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 50)
                                .background(.brown)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                        
                        Spacer()
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "gearshape.fill")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .shadow(radius: 5)
                        }
                        Spacer()
                    }.frame(width: geo.size.width)
                    Spacer()
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
