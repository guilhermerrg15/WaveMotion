//
//  FinalView.swift
//  WaveMotion
//
//  Created by Guilherme Gomes on 19/04/23.
//

import SwiftUI

struct FinalView: View {
    
    @State private var showModal = false
    @State private var isShowingRectangle = false
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Color("ColorBackground")
                    .ignoresSafeArea()
                VStack{
                    Text("Compare the Wavelengths")
                        .foregroundColor(Color("ColorText"))
                        .font(.custom("Futura", size: 30))
                        .padding(.top, 150)
                    ScrollView {
                        VStack(spacing: 20) {
                            
                            ForEach(1...3, id: \.self) { index in
                                
                                Image("finalImage\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 250)
                            }
                            
                        }
                    }
                }
                if isShowingRectangle {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .frame(width: 600, height: 400)
                        Text("Thanks for trying out my Playground!\n I hope you learned a little more about electromagnetic waves and their importance :)")
                            .font(.custom("Futura", size: 30))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, geometry.size.width/8)
                        
                        Image(systemName: "x.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .offset(x:250,y: -150)
                            .onTapGesture {
                                isShowingRectangle = false
                            }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    isShowingRectangle = true
                }
            }
        }
    }
}


