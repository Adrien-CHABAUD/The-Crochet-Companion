//
//  DataMockUp.swift
//  The Crochet Companion
//
//  Created by Adrien CHABAUD on 2023-12-08.
//

import Foundation

final class DataMockUp: ObservableObject {
    @Published var projectItems: [ProjectItem] = []
    
    init(){
        projectItems = makeData()
    }
    
    private func makeData() -> [ProjectItem]{
        (1...12)
            .map {
                ProjectItem(name: "Test_\($0)", stitchInRow: $0 + 1)
            }
    }
}
