//
//  Settings.swift
//  HP Trivia
//
//  Created by Kyaw Thant Zin(George) on 9/4/24.
//

import SwiftUI

enum BookStatus {
    case active
    case inactive
    case locked
}

struct Settings: View {
    @Environment (\.dismiss) private var dismiss
    //for changing from selected to unselected and vice versa
    //there are seven books so seven status array.
    @State private var books : [BookStatus] = [.active,.active,.inactive,.locked,.locked,.locked,.locked]
    var body: some View {
        ZStack{
            InfoBackgroundImage()
            VStack{
                Text("Which books would you love to see questions from?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                ScrollView{
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(0..<7) { i in
                            
                            //selected item sample
                            
                            if books[i] == .active {
                                ZStack(alignment: .bottomTrailing) {
                                    Image("hp\(i+1)")
                                        .resizable()
                                        .scaledToFit()
                                    .shadow(radius: 7)
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .foregroundStyle(.green)
                                        .shadow(radius: 1)
                                        .padding(3)
                                    //change select or unselect status
                                }.onTapGesture {
                                    books[i] = .inactive
                                }
                            }
                            //unselected item sample
                            else if books[i] == .inactive {
                                ZStack(alignment: .bottomTrailing){
                                    Image("hp\(i+1)")
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
                                    
                                }.onTapGesture {
                                    books[i] = .active
                                }
                            }
                            //locked book sample
                            else {
                                ZStack(alignment: .center){
                                    Image("hp\(i+1)")
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
                            }
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
