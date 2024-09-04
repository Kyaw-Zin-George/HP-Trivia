//
//  ContentView.swift
//  HP Trivia
//
//  Created by Kyaw Thant Zin(George) on 8/30/24.
//

import SwiftUI
import AVKit

struct ContentView: View {
    //creating audio property
    @State private var audioPlayer: AVAudioPlayer!
    @State private var scalePlayButton = false
    @State private var moveBackgroundImage = false
    //trigger the animation for the transition
    @State private var animateViewsIn = false
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height)
                    .padding(.top, 3)
                //adding animation
                // how the image will be moved(horizontally)
                    .offset(x: moveBackgroundImage ? geo.size.width / 1.1 : -geo.size.width / 1.1)
                //what to do when the screen appears
                    .onAppear{
                        withAnimation(.linear(duration: 60).repeatForever()) {
                            moveBackgroundImage.toggle()
                        }
                    }
                
                VStack{
                   VStack {
                        if animateViewsIn{
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
                            //needs animation to work the transition
                                .transition(.move(edge: .top))
                        }
                   }.animation(.easeOut(duration: 0.7).delay(2), value: animateViewsIn)
                    
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
                        .scaleEffect(scalePlayButton ? 1.2 : 1)
                        .onAppear{
                            withAnimation(.easeInOut(duration: 1.3).repeatForever()) {
                                scalePlayButton.toggle()
                            }
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
            .onAppear{
                // playAudio()
                //trigger the animation
                animateViewsIn = true
            }
    }
    private func playAudio() {
        let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(filePath: sound!))
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
    }
}

#Preview {
    ContentView()
}
