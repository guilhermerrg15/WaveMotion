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
    
    @State var selectedElement: Int?
    var body: some View {
        ZStack {
            VStack {
                
                Text(text)
                    .font(.custom("Futura", size: 30))
                    .foregroundColor(Color("ColorText"))
                
                ZStack {
                    
                    Image(backImage)
                    
                    ForEach(0..<elementImages.count) { index in
                        Button(action: {
                            showModal = true
                            selectedElement = index
                        }, label: {
                            Image(elementImages[currentIndex].name)
                            
                        }).padding(.top, elementImages[currentIndex].position.y)
                          .padding(.leading, elementImages[currentIndex].position.x)
                    }
                }
            }
            if selectedElement != nil && showModal {
                VStack {
                    Spacer()
                    CardView(cardModel: cardModels[elementImages[currentIndex].cardModelIndex], showModal: $showModal)
                        //.padding(.bottom, 5)
                }
            }
        }
    }
}



