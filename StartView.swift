
//  Created by Guilherme Gomes on 29/03/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack{
            Color("ColorBackground")
                .ignoresSafeArea()
            GeometryReader{
                let size = $0.size
                VStack{
                    Image("rainbowWave")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height/4)
                    Text("WAVE MOTION")
                        .font(.system(size: 100))
                        .foregroundColor(Color("ColorText"))
                    Group{
                        Text("Start")
                            .font(.system(size: 70))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 220,height: 100)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 60)
                                    .fill(Color("ColorText"))
                            )
                    } .padding(.top, 60)
                }
                .padding(.top, 300)
            }
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

