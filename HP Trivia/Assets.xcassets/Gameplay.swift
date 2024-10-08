//
//  Gameplay.swift
//  HP Trivia
//
//  Created by Kyaw Thant Zin(George) on 9/4/24.
//

import SwiftUI

struct Gameplay: View {
    //for transaction
    @State private var animateViewsIn = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
               Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height * 1.05)
                    .overlay(Rectangle().foregroundStyle(.black.opacity(0.8)))
                
                VStack{
                    // MARK: Controls
                    HStack{
                        Button{
                            
                        }label:{
                            Text("End Game")
                        }.buttonStyle(.borderedProminent)
                            .tint(.red.opacity(0.5))
                        Spacer()
                        
                        Text("Score: 33")
                            
                    }.padding()
                        .padding(.vertical, 30)
                    
                    // MARK: Questions
                    VStack {
                        if animateViewsIn {
                            Text("Who is Harry Potter?")
                                .font(.custom(Constant.hpFont, size: 50))
                            // for multi line questions
                                .multilineTextAlignment(.center)
                                .padding()
                                .transition(.scale)
                        }
                    }.animation(.easeInOut(duration: 2),value: animateViewsIn)
                    
                    Spacer()
                    //MARK: Hint and book
                    HStack{
                        //Hint Button
                        VStack {
                            if animateViewsIn {
                                Image(systemName: "questionmark.app.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .foregroundStyle(.cyan)
                                    .rotationEffect(.degrees(-15))
                                    .padding()
                                    .padding(.leading, 20)
                                .transition(.offset(x: -geo.size.width / 2))
                            }
                        }.animation(.easeOut(duration: 1.5).delay(2),value:  animateViewsIn)
                        
                        Spacer()
                        
                        //book icon
                        VStack {
                            if animateViewsIn {
                                Image(systemName: "book.closed")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .foregroundStyle(.black)
                                    .frame(width: 100, height: 100)
                                    .background(.cyan)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .rotationEffect(.degrees(15))
                                    .padding()
                                    .padding(.trailing, 20)
                                .transition(.offset(x: geo.size.width / 2))
                            }
                        }.animation(.easeOut(duration: 1.5).delay(2),value: animateViewsIn)
                        
                    }
                    .padding(.bottom)
                    //MARK: Answers
                    LazyVGrid(columns: [GridItem(),GridItem()]){
                        ForEach(1..<5){ i in
                            VStack {
                                if animateViewsIn {
                                    Text(i == 3 ? "The boy who basically lived and got sent to the relatives got treated badly if i am being honest.":"Answer: \(i)")
                                    //to show all the text in the green area
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .padding(10)
                                        .frame(width: geo.size.width / 2.15, height: 80)
                                        .background(.green.opacity(0.5))
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .transition(.scale)
                                }
                            }.animation(.easeOut(duration: 1).delay(1.5),value: animateViewsIn)
                        }
                    }
                    Spacer()
                }.frame(width: geo.size.width, height: geo.size.height)
                    .foregroundStyle(.white)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear{
            animateViewsIn = true
        }
    }
}

#Preview {
    Gameplay()
}
