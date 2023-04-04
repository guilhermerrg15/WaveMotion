//  Created by Guilherme Gomes on 30/03/23.
//

import SwiftUI


@available(iOS 16.0, *)
struct WelcomeView: View {
    var body: some View {
        NavigationStack{
            GeometryReader{ geo in
                ZStack{
                    Color("ColorBackground")
                        .ignoresSafeArea()
                    VStack{
                        Image("rainbowWave")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: geo.size.height/4)
                        Text("Welcome!")
                            .font(.system(size: 100))
                            .foregroundColor(Color("ColorText"))
                            .padding(.bottom, 20)
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ")
                            .font(.system(size: 30))
                            .foregroundColor(Color("ColorText"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 80)
                        NavigationLink(destination: EnvironmentView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "chevron.right")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(width: 55, height: 55)
                                .foregroundColor(.white)
                                .background {
                                    RoundedRectangle(cornerRadius: 30, style: .circular)
                                        .fill(Color("ColorText"))
                                }
                                .padding(.top, 60)
                        }
                        Spacer()
                    } .padding(.top, 200)
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

