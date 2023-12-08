//
//  ProjectScreen.swift
//  The Crochet Companion
//
//  Created by Adrien CHABAUD on 2023-11-17.
//

import SwiftUI

struct ProjectScreen: View {
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Test_1"){
                    CountingScreen(projectName: "Test_1")
                }
                NavigationLink("Test_2"){
                    CountingScreen(projectName: "Test_2")
                }
                NavigationLink("Test_3"){
                    CountingScreen(projectName: "Test_3")
                }
            }
        }
    }
}

#Preview {
    ProjectScreen()
}
