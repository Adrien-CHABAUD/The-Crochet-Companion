//
//  ContentView.swift
//  The Crochet Companion
//
//  Created by Adrien CHABAUD on 2023-11-15.
//

import SwiftUI

struct CountingScreen: View {
    @Binding var projectName: String
    
    @State private var counter = 0
    @State private var showAlert = false
    
    var body: some View {
        VStack{
//            Button(action: {UIApplication.shared.isIdleTimerDisabled = true}, label: {
//                Text("Do not go to sleep")
//            }).padding(.bottom)
//            Button(action: {UIApplication.shared.isIdleTimerDisabled = false}, label: {
//                Text("Do go to sleep")
//            })
            ZStack {
                // Counter button
                Button {
                    counter += 1
                } label: {
                    // Circle Button
                    Circle()
                        .foregroundStyle(.tealBlue)
                        .frame(width: 300, height: 300)
                        .shadow(radius: 8, y: 10)
                }
                
                // Text on top
                Text("\(counter)")
                    .font(.system(size: 104))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }.padding(.bottom, 20)
            
            // Undo button
            Button {
                if counter == 0 {
                    showAlert.toggle()
                } else {
                    counter -= 1
                }
            } label: {
                ZStack {
                Rectangle()
                        .foregroundStyle(.dustyRed)
                        .clipShape(.rect(cornerRadius: 20))
                        .frame(width: 100, height: 50)
                        .shadow(radius:5, y: 5)
                    
                Text("Undo")
                    .foregroundStyle(.white)
                    .fontWeight(.regular)
                    
                }
            }.alert("There is no such thing as negative rows", isPresented: $showAlert){
                Button("OK", role: .cancel){}
            }
                
        }
    }
}

#Preview {
    CountingScreen(projectName: .constant("Twisted Mittens"))
}
