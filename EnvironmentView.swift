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
    @State private var currentPageIndex = 0
    
    let environmentsMini = [
        ("Hospital", "miniHospital"),
        ("Living Room", "miniLivingRoom"),
        ("Kitchen", "miniKitchen")
    ]
    
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .ignoresSafeArea()
            menuScreen
            
            NavBar
            
            WalkThroughScreens()
            
            
        }
        .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkThroughScreens)
    }
    
    var menuScreen: some View {
        GeometryReader{ geometry in
            VStack(spacing: 50) {
                Text("Choose your environment:")
                    .font(.system(size: 60))
                    .bold()
                    .foregroundColor(Color("ColorText"))
                    .padding(.bottom,70)
                ForEach(Array(environmentsMini.enumerated()), id: \.0) { index, item in
                    HStack {
                        Text(item.0)
                            .font(.system(size: 60))
                            .bold()
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
                }
            }
            .padding(.top, 120)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .offset(y:showWalkThroughScreens ? -geometry.size.height : 0)
            .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8, blendDuration: 0.5), value: showWalkThroughScreens)
        }
        .ignoresSafeArea()
    }
    
    var NavBar: some View {
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
        .offset(y: showWalkThroughScreens ? 0 : -120)
    }
    
    @ViewBuilder
    func ScreenView(size: CGSize, index: Int)-> some View{
        let environment = environments[index]
        
        VStack(spacing: 40) {
            Text(environment.title)
                .foregroundColor(Color("ColorText"))
                .font(.system(size: 60))
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ")
                .foregroundColor(Color("ColorText"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8, blendDuration: 0.5).delay(0.1), value: currentIndex)
            
            Image(environment.imageName)
            //.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal, 20)
                .offset(x: -size.width * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9,dampingFraction: 0.8, blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2), value: currentIndex)
            Spacer()
            
        } .padding(.top, 80)
    }
    
    
    @ViewBuilder
    func WalkThroughScreens() -> some View {
        GeometryReader { geometry in
            let size = geometry.size
            ZStack {
                ForEach(environments.indices, id: \.self) { index in
                    ScreenView(size: size, index: index)
                }
                HStack {
                    if currentIndex > 0 {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(Color("ColorText"))
                            .padding()
//                            .onTapGesture {
//                                currentIndex -= 1
//                            }
                    }
                    Spacer()
                    if currentIndex < environments.count - 1 {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 40, weight: .bold))
                            .foregroundColor(Color("ColorText"))
                            .padding()
//                            .onTapGesture {
//                                currentIndex += 1
//                            }
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < 0, currentIndex < environments.count - 1 {
                            currentIndex += 1
                        } else if value.translation.width > 0, currentIndex > 0 {
                            currentIndex -= 1
                        }
                    }
            )
            .offset(y: showWalkThroughScreens ? 0 : size.height)
            .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.5), value: showWalkThroughScreens)
            .navigationBarHidden(true)
        }
    }

}




@available(iOS 16.0, *)
struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView()
    }
}
