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
}
var environments: [Environment] = [
    .init(imageName: "Image 1", title: "Hospital"),
    .init(imageName: "Image 2", title: "LivingRoom"),
    .init(imageName: "Image 3", title: "Kitchen"),
]
