//
//  Instructions.swift
//  HP Trivia
//
//  Created by Kyaw Thant Zin(George) on 9/4/24.
//

import SwiftUI

struct Instructions: View {
    @Environment (\.dismiss) private var dismiss
    var body: some View {
        ZStack{
           InfoBackgroundImage()
            
            //app icon
            VStack{
                Image("appiconwithradius")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top)
                
                ScrollView{
                    Text("How to Play")
                        .font(.largeTitle)
                        .padding()
                    
                    VStack(alignment:.leading){
                        Text("Welcome to HP Trivia! In this game, you will be asked random questions from HP books and you must guess the right answer or you will lose points! 😱")
                            .padding([.horizontal,.bottom])
                        
                        Text("Each question is worth 5 points. But if you guess the wrong answer, you will lose 1 point.")
                            .padding([.horizontal,.bottom])
                        
                        Text("If you are struggling on a question, there is an option to reveal hint or reveal book that answers the question. Beware! You will lose 1 point each by doing so.")
                            .padding([.horizontal,.bottom])
                        
                        Text("When you select the correct answer, you will be awarded all the points left for that question and they will be added to your total score.")
                            .padding(.horizontal)
                    }.font(.title3)
                    Text("Good Luck!")
                        .font(.title)
                }
                .foregroundStyle(.black)
                
                Button("Done"){
                    dismiss()
                }
                .doneButton()
               
            }
            
        }
    }
}

#Preview {
    Instructions()
}
