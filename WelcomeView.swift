//  Created by Guilherme Gomes on 30/03/23.
//

import SwiftUI


struct WelcomeView: View {
    var body: some View {
        //NavigationStack{
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
                        .font(.system(size: 35))
                        .foregroundColor(Color("ColorText"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 80)
                    Spacer()
                } .padding(.top, 200)
            }
        }
        //}
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

