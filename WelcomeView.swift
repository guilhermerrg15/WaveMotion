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
                        Image("welcomeImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width/1.2)
                            .padding(.leading)
                       
                        Text("Welcome!")
                            .font(.system(size: 60))
                            .foregroundColor(Color("ColorText"))
                            .padding(.bottom, 20)
                        Text("As you can see above, all these objects have an importance in the world we live in, and each one of them is composed of electromagnetic waves. For each of these waves, there is a different radiation, wavelength and frequency. Today, you are going to compare some of them and learn more about it.")
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

