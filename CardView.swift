import SwiftUI
struct CardView: View {
    var cardModel: CardModel
    @Binding var showModal: Bool
    
    let waveFrequency: CGFloat = 8
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .circular)
                    .fill(Color.white)
                    .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/4.5)
                HStack {
                    Group {
                        VStack {
                            Text(cardModel.waveName)
                                .font(.custom("Futura", size: 35))
                                .foregroundColor(Color("ColorText"))
                            
                            
                            Image(cardModel.waveImage)
                            
                        }
                    } .padding(.leading, 120)
                    
                    Group{
                        VStack{
                            Text(cardModel.waveLength)
                            
                                .font(.custom("Futura", size: 35))
                                .foregroundColor(Color("ColorText"))
                                .padding(.leading, 46)
                                .padding(-5)
                            
                            Text(cardModel.energyMeasure)
                                .font(.custom("Futura", size: 35))
                                .foregroundColor(Color("ColorText"))
                            
                            HStack{
                                ForEach(0..<cardModel.energyImage.count) { index in
                                    Image(cardModel.energyImage[index])
                                }
                            } .padding(.leading, 40)
                            
                            
                        } .padding(.leading, 60)
                        Spacer()
                    }
                }
            }
            Button("Close") {
                showModal = false
            }
        }
    }
}
