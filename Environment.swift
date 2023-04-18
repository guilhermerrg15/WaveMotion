//
//  Environments.swift
//  WaveMotion
//
//  Created by Guilherme Gomes on 30/03/23.
//

import Foundation
import SwiftUI

struct Environment: Identifiable{
    var id: String = UUID().uuidString
    var imageName: String

    var title: String
    var elements: [Element] = []
}

struct Element: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var position: CGPoint
}

var environments: [Environment] = [
    .init(imageName: "Hospital", title: "Hospital"),
    .init(imageName: "LivingRoom", title: "Living Room"),
    .init(imageName: "Kitchen", title: "Kitchen"),
]
