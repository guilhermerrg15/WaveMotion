//
//  CardModel.swift
//  WaveMotion
//
//  Created by Guilherme Gomes on 17/04/23.
//

import Foundation

struct CardModel {
    var waveName: String
    var waveImage: String
    var waveLength: String
    var energyMeasure: String
    var energyImage: [String]
}

var cardModels: [CardModel] = [
    CardModel(waveName: "X-Ray Machine", waveImage: "waveXray", waveLength: "Length: 0.1 to 10nm", energyMeasure: "Energy:", energyImage: ["lightBulbOn", "lightBulbOn", "lightBulbOn"]),
    CardModel(waveName: "Television", waveImage: "waveRadio", waveLength: " Length: 1cm to 10cm", energyMeasure: "Energy:", energyImage: ["lightBulbOn", "lightBulbOff", "lightBulbOff"]),
    CardModel(waveName: "Microwave", waveImage: "waveMicrowave", waveLength: "Length: 1mm to 1cm", energyMeasure: "Energy:", energyImage: ["lightBulbOn", "lightBulbOn", "lightBulbOff"])
]


