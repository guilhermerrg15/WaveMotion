
//  Created by Guilherme Gomes on 29/03/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct StartView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color("ColorBackground")
                    .ignoresSafeArea()
                GeometryReader{
                    let size = $0.size
                    VStack{
                        Spacer()
                        Image("rainbowWave")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height/4)
                        Text("WAVE MOTION")
                            .font(.system(size: 100))
                            .foregroundColor(Color("ColorText"))
                        Group{
                            NavigationLink(destination: WelcomeView()/*.navigationBarBackButtonHidden(true)*/) {
                                Text("Start")
                                    .font(.system(size: 70))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 220, height: 100)
                                    .background(
                                        RoundedRectangle(cornerRadius: 60)
                                            .fill(Color("ColorText"))
                                    )
                                    .padding(.top, 60)
                            }
                        }
                        //.padding(.top, 300)
                        Spacer()
                    }
                }
            }
        }
    }
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            StartView()
        }
    }
    
}
