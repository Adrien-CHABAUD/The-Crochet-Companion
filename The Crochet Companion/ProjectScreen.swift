//
//  ProjectScreen.swift
//  The Crochet Companion
//
//  Created by Adrien CHABAUD on 2023-11-17.
//

import SwiftUI

struct ProjectScreen: View {
    @ObservedObject var mockData = DataMockUp()
    
    var body: some View {
        NavigationStack {
            
            List(mockData.projectItems){data in
                NavigationLink(data.name){
                    CountingScreen(projectName: data.name, numberStitchRow: data.stitchInRow)
                }
            }
        }
    }
}

#Preview {
    ProjectScreen()
}
