//
//  ProjectItem.swift
//  The Crochet Companion
//
//  Created by Adrien CHABAUD on 2023-12-08.
//

import Foundation

struct ProjectItem: Equatable, Identifiable {
    var id = UUID()
    let name: String
    var storedRow: Int = 0
    var storedStitch: Int = 0
    var stitchInRow: Int
}
