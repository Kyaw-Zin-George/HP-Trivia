//
//  Gameplay.swift
//  HP Trivia
//
//  Created by Kyaw Thant Zin(George) on 9/4/24.
//

import SwiftUI

struct Gameplay: View {
    @Environment(\.dismiss) private var dis
    //for transaction
    @State private var animateViewsIn = false
    //for transition of celebration screen
    @State private var tappedCorrectAnswer = false
    
    @State private var hintWiggle = false
    @State private var scaleNextLevelButton = false
    //for animation for the gained points
    @State private var movePointsToScore = false
    @State private var revealHint = false
    @State private var revealBook = false
    //to connect different view to set as one view
    @Namespace private var nameSpace
    
    //temp data
    let tempAnswers = [true,false,false,false]
    
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
                            //TODO: End Game
                            dis()
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
                                //getting some wiggling effect
                                    .rotationEffect(.degrees( hintWiggle ? -14 : -17))
                                    .padding()
                                    .padding(.leading, 20)
                                .transition(.offset(x: -geo.size.width / 2))
                                //how we wiggle
                                .onAppear{
                                    withAnimation(.easeInOut(duration: 0.1).repeatCount(9).delay(5).repeatForever()){
                                        hintWiggle = true
                                    }
                                }
                                //how we show the hint
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 1)) {
                                        revealHint = true
                                    }
                                }
                                .rotation3DEffect(
                                    .degrees(revealHint ? 1440 : 0),axis: (x: 0.0, y: 1.0, z: 0.0))
                                .scaleEffect(revealHint ? 5 : 1)
                                .opacity(revealHint ? 0 : 1)
                                .offset(x: revealHint ? geo.size.width / 2 : 0)
                                //something to show when the question  is clicked
                                .overlay(
                                Text("The boy who ...")
                                    .padding(.leading, 33)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .opacity(revealHint ? 1:0)
                                    .scaleEffect(revealHint ? 1.33 : 1)
                                )
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
                                    .rotationEffect(.degrees( hintWiggle ? 14 : 17))
                                    .padding()
                                    .padding(.trailing, 20)
                                .transition(.offset(x: geo.size.width / 2))
                                .onAppear{
                                    withAnimation(.easeInOut(duration: 0.1).repeatCount(9).delay(5).repeatForever()){
                                        hintWiggle = true
                                    }
                                }
                                //how we show the hint
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 1)) {
                                        revealBook = true
                                    }
                                }
                                .rotation3DEffect(
                                    .degrees(revealBook ? 1440 : 0),axis: (x: 0.0, y: 1.0, z: 0.0))
                                .scaleEffect(revealBook ? 5 : 1)
                                .opacity(revealBook ? 0 : 1)
                                .offset(x: revealBook ? -geo.size.width / 2 : 0)
                                //something to show when the question  is clicked
                                .overlay(
                                Image("hp1")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.trailing, 33)
                                    .opacity(revealBook ? 1:0)
                                    .scaleEffect(revealBook ? 1.33 : 1)
                                )
                            }
                        }.animation(.easeOut(duration: 1.5).delay(2),value: animateViewsIn)
                        
                    }
                    .padding(.bottom)
                    //MARK: Answers
                    LazyVGrid(columns: [GridItem(),GridItem()]){
                        ForEach(1..<5){ i in
                            if tempAnswers [i-1] == true{
                                VStack {
                                    if animateViewsIn {
                                        if tappedCorrectAnswer == false {
                                            Text("Answer: \(i)")
                                            //to show all the text in the green area
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.center)
                                                .padding(10)
                                                .frame(width: geo.size.width / 2.15, height: 80)
                                                .background(.green.opacity(0.5))
                                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                            //2 different transition with asymmetric
                                                .transition(.asymmetric(insertion: .scale, removal: .scale(scale: 5).combined(with: .opacity.animation(.easeOut(duration: 0.5)))))
                                                .matchedGeometryEffect(id: "answer", in: nameSpace)
                                                .onTapGesture {
                                                    withAnimation(.easeOut(duration: 1)) {
                                                        tappedCorrectAnswer = true
                                                    }
                                                }
                                        }
                                    }
                                }.animation(.easeOut(duration: 1).delay(1.5),value: animateViewsIn)
                            }
                            else{
                                VStack {
                                    if animateViewsIn {
                                        Text("Answer: \(i)")
                                        //to show all the text in the green area
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.center)
                                            .padding(10)
                                            .frame(width: geo.size.width / 2.15, height: 80)
                                            .background(.green.opacity(0.5))
                                            .clipShape(RoundedRectangle(cornerRadius: 25))
                                        .transition(.scale)
                                    }
                                }.animation(.easeOut(duration: 1).delay(1.5), value: animateViewsIn)
                            }
                        }
                    }
                    Spacer()
                }.frame(width: geo.size.width, height: geo.size.height)
                    .foregroundStyle(.white)
                
              
                // MARK: Celebration
                VStack{
                    Spacer()
                    
                    VStack{
                        if tappedCorrectAnswer {
                            Text("5")
                                .font(.largeTitle)
                                .padding(.top, 50)
                                .transition(.offset(y: -geo.size.height / 4))
                                .offset(x: movePointsToScore ? geo.size.width / 2.3 : 0, y: movePointsToScore ? -geo.size.height / 12 : 0)
                                .opacity(movePointsToScore ? 0 : 1)
                            //animation
                                .onAppear{
                                    withAnimation (.easeInOut(duration: 1).delay(3)){
                                        movePointsToScore = true
                                    }
                                }
                        }
                    }.animation(.easeInOut(duration: 1).delay(2), value: tappedCorrectAnswer)
                    
                    Spacer()
                    
                    VStack {
                        if tappedCorrectAnswer {
                            Text("Brilliant!")
                                .font(.custom(Constant.hpFont, size: 100))
                            //want the text to become bigger as it goes down
                            .transition(.scale.combined(with: .offset(y: -geo.size.height / 2)))
                        }
                    }.animation(.easeInOut(duration: 1).delay(1), value: tappedCorrectAnswer)
                    
                    Spacer()
                    //Data
                    VStack {
                        if tappedCorrectAnswer {
                            Text("Answer 1")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .padding(10)
                                .frame(width: geo.size.width/2.15, height: 80)
                                .background(.green.opacity(0.5))
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                            //make the answer twice as big
                            .scaleEffect(2)
                            .matchedGeometryEffect(id: "answer", in: nameSpace)
                        }
                    }
                    
                    Group {
                        Spacer()
                        Spacer()
                    }
                    
                        
                    VStack {
                        if tappedCorrectAnswer {
                            Button{
                                
                            }label: {
                                Text("Next Level>")
                                //TODO: Reset level for next question
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.blue.opacity(0.5))
                            .font(.largeTitle)
                        .transition(.offset(y: geo.size.height / 3))
                        .scaleEffect(scaleNextLevelButton ? 1.2 : 1)
                        .onAppear{
                            withAnimation(.easeInOut(duration: 1.3).repeatForever()) {
                                scaleNextLevelButton.toggle()
                            }
                        }
                        }
                    }.animation(.easeInOut(duration: 2.7).delay(2.7), value: tappedCorrectAnswer)
                    
                    Group {
                        Spacer()
                        Spacer()
                    }
                }.foregroundStyle(.white)
                
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear{
           animateViewsIn = true
        //tappedCorrectAnswer = true
        }
    }
}

#Preview {
    Gameplay()
}
