//
//  EnvironmentView.swift
//  WaveMotion
//
//  Created by Guilherme Gomes on 30/03/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct EnvironmentView: View {
    
    @State var showWalkThroughScreens: Bool = false
    @State var currentIndex: Int = 0
    @State private var isFinalViewActive = false
    let environmentsMini = [
        ("Hospital", "miniHospital"),
        ("Living Room", "miniLivingRoom"),
        ("Kitchen", "miniKitchen")
    ]
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("ColorBackground")
                    .ignoresSafeArea()
                menuScreen
                walkThroughScreens()
            }
            .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkThroughScreens)
        }
    }
    
    var menuScreen: some View {
        VStack(spacing: 50) {
            Text("Choose your environment:")
                .font(.system(size: 60))
                .multilineTextAlignment(.center)
                .scaledToFit()
                .bold()
                .foregroundColor(Color("ColorText"))
                .padding(.bottom,20)
            Divider()
                .frame(width: UIScreen.main.bounds.width/1.1,height: 5)
                .background(Color("ColorText"))
            ForEach(environmentsMini.indices, id: \.self) { index in
                let item = environmentsMini[index]
                HStack {
                    Text(item.0)
                        .font(.system(size: 60))
                        .foregroundColor(Color("ColorText"))
                    Spacer()
                    Image(item.1)
                        .tag(index)
                        .frame(width: UIScreen.main.bounds.width/2.5)
                        .onTapGesture {
                            currentIndex = index
                            showWalkThroughScreens.toggle()
                        }
                }
                .padding(.leading, 80)
                if index != environmentsMini.indices.last {
                    Divider()
                        .frame(width: UIScreen.main.bounds.width/1.1, height: 5)
                        .background(Color("ColorText"))
                }
            }
            
        }
        .padding(.top, 100)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .offset(y:showWalkThroughScreens ? -UIScreen.main.bounds.height : 0)
        .ignoresSafeArea()
    }
    
    var navBar: some View {
        HStack{
            Button{
                currentIndex = -1
                showWalkThroughScreens.toggle()
            } label: {
                Image(systemName: "house.fill")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("ColorText"))
            }
            Spacer()
        }
        .padding(.horizontal,15)
        .padding(.top,10)
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(y: showWalkThroughScreens ? 0 : 120)
    }
    
    @ViewBuilder
    func walkThroughScreens() -> some View {
        GeometryReader { geometry in
            let size = geometry.size
            ZStack {
                ForEach(0..<3) { index in
                    sceneSelector(size: size, index: index)
                        .offset(x: -size.width * CGFloat(currentIndex - index))
                        .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
                }
                
                navBar
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(Color("ColorText"))
                        .padding()
                        .onTapGesture {
                            currentIndex -= 1
                        }
                        .opacity(currentIndex == 0 ? 0 : 1)
                    
                    Spacer()
                    if currentIndex < 2 {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(Color("ColorText"))
                            .padding()
                            .onTapGesture {
                                currentIndex += 1
                            }
                    }
                    if currentIndex == 2{
                        VStack{
                            NavigationLink(
                                destination: FinalView().navigationBarBackButtonHidden(true),
                                isActive: $isFinalViewActive,
                                label: {
                                    Group{
                                        Text("Continue")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 8)
                                            .background(Color("ColorText"))
                                            .cornerRadius(8)
                                    } .padding(.top, 30)
                                        .padding(.trailing)
                                })
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .bottom)
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: showWalkThroughScreens)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .offset(y: showWalkThroughScreens ? 0 : size.height)
            
            .navigationBarHidden(true)
        }
    }
    
    @ViewBuilder
    func sceneSelector(size: CGSize, index:Int)-> some View {
        switch index {
        case 0:
            SceneImage(text: "      Find the element\n that produces frequency", backImage: "Hospital", elementImages: [("xray", CGPoint(x: -120, y: -80), 0)])
        case 1:
            SceneImage(text: "      Find the element\n that produces frequency", backImage: "LivingRoom", elementImages: [("television", CGPoint(x: 258, y: 218), 1)])
        case 2:
            SceneImage(text: "      Find the element\n that produces frequency", backImage: "Kitchen", elementImages: [("microwave", CGPoint(x: 450, y: 0), 2)])
        default:
            Text("Deu Ruim")
        }
    }
}

