//
//  EnvironmentView.swift
//  WaveMotion
//
//  Created by Guilherme Gomes on 30/03/23.
//

import SwiftUI

struct EnvironmentView: View {
    @State var showWalkThroughScreens: Bool = false
    
    let environments = [
        ("Living Room", "miniLivingRoom"),
        ("Hospital", "miniHospital"),
        ("Kitchen", "miniKitchen")
    ]
    
    var body: some View {
        ZStack{
            Color("ColorBackground")
                .ignoresSafeArea()
            menuScreen
                .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85, blendDuration: 0.85), value: showWalkThroughScreens)
            NavBar()
        }
    }
    
    @ViewBuilder
    func NavBar()-> some View{
        
    }
    
    var menuScreen: some View {
        GeometryReader{
            let size = $0.size
            VStack(spacing: 50) {
                Text("Choose your environment:")
                    .font(.system(size: 60))
                    .bold()
                    .foregroundColor(Color("ColorText"))
                    .padding(.bottom,70)
                ForEach(Array(environments.enumerated()), id: \.0) { index, item in
                    HStack {
                        Spacer()
                        if (index == 1 || index == 2) {
                                Text(item.0)
                                    .font(.system(size: 60))
                                    .bold()
                                    .foregroundColor(.red)
                                    .background(Color.red)
                        } else {
                            Text(item.0)
                                .font(.system(size: 60))
                                .bold()
                                .foregroundColor(Color("ColorText"))
                        }
                        Spacer()
                        Image(item.1)
                            .frame(width: UIScreen.main.bounds.width/2.5)
                            .onTapGesture {
                                showWalkThroughScreens.toggle()
                            }
                    }
                }
            }
            .padding(.top, 120)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .offset(y:showWalkThroughScreens ? -size.height : 0)
        }
        .ignoresSafeArea()
    }
}


struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView()
    }
}
