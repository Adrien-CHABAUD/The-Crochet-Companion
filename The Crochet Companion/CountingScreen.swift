//
//  ContentView.swift
//  The Crochet Companion
//
//  Created by Adrien CHABAUD on 2023-11-15.
//

import SwiftUI

struct CountingScreen: View {
    var projectName: String
    
    @State private var showAlert = false
    
    @State private var rowNumber = 1
    
    @State private var stitchNumber = 0
    @State private var numberStitchRow = 5
    
    var body: some View {
        VStack{
//            Button(action: {UIApplication.shared.isIdleTimerDisabled = true}, label: {
//                Text("Do not go to sleep")
//            }).padding(.bottom)
//            Button(action: {UIApplication.shared.isIdleTimerDisabled = false}, label: {
//                Text("Do go to sleep")
//            })
            
            Text("\(projectName)")
                .foregroundStyle(.tealBlue)
                .fontWeight(.heavy)
                .font(.system(size: 30))
            
            HStack {
                Text("Row: \(rowNumber)")
                Text("Stitch: \(stitchNumber)")
            }
            .foregroundStyle(.dustyRed)
            .font(.system(size: 20))
            .fontWeight(.semibold)
            
            ZStack {
                // Counter button
                Button {
                    stitchNumber += 1
                    updateRow()
                } label: {
                    // Circle Button
                    Circle()
                        .foregroundStyle(.tealBlue)
                        .frame(width: 300, height: 300)
                        .shadow(radius: 8, y: 10)
                }
                
                // Text on top
                Text("\(stitchNumber)")
                    .font(.system(size: 104))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }.padding(.bottom, 20)
            
            // Undo button
            Button {
                if stitchNumber == 0 {
                    showAlert.toggle()
                } else {
                    stitchNumber -= 1
                    updateRow()
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
    
    func updateRow(){
        if stitchNumber != 0 {
            let result = (stitchNumber % numberStitchRow) == 0 ? 1 : 0
            rowNumber += result
            
            if result == 1 {
                stitchNumber = 1
            }
        }
    }
}

#Preview {
    CountingScreen(projectName: "Twisted Mittens")
}
