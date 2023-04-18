//
//  SceneImage.swift
//  WaveMotion
//
//  Created by Guilherme Gomes on 11/04/23.


import SwiftUI
@available(iOS 16.0, *)

struct SceneImage: View {
    @State var showModal = false
    @State var currentIndex: Int = 0
    
    var text: String
    var backImage: String
    var elementImages: [(name: String, position: CGPoint, cardModelIndex: Int)]
    
    var body: some View {
        VStack {
            Text(text)
                //.offset(x: 0, y: -20)
                .font(.custom("Futura", size: 30))
                .foregroundColor(Color("ColorText"))
            
            ZStack {
                
                Image(backImage)
                
                ForEach(0..<elementImages.count) { index in
                    if showModal {
                        CardView(cardModel: cardModels[elementImages[currentIndex].cardModelIndex], showModal: $showModal)
                    }
                    Button(action: {
                        showModal = true
                    }, label: {
                        Image(elementImages[currentIndex].name)
                            .padding(.top, elementImages[currentIndex].position.y)
                            .padding(.leading, elementImages[currentIndex].position.x)
                    })
                }
            }
        }
    }
}



