import SwiftUI
struct CardView: View {
    var cardModel: CardModel
    @Binding var showModal: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .circular)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color("ColorText"), lineWidth: 2)
                        )
                        .frame(width: geometry.size.width/1.5, height: geometry.size.height / 4)
                    Button {
                        showModal = false
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color("ColorText"))
                            .padding(.bottom, geometry.size.height/5)
                            .padding(.leading, geometry.size.width/1.7)
                    }
                    
                    HStack{
                        Group{
                            VStack {
                                Text(cardModel.waveName)
                                    .font(.custom("Futura", size: geometry.size.width/30))
                                    .foregroundColor(Color("ColorText"))
                                
                                Image(cardModel.waveImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width/5)
                            }
                            .padding(.leading, geometry.size.width/7)
                        }
                        Group{
                            VStack {
                                Text(cardModel.waveLength)
                                    .font(.custom("Futura", size: geometry.size.width/35))
                                    .foregroundColor(Color("ColorText"))
                                    .padding(.leading, geometry.size.width/10)
                                
                                
                                Text(cardModel.energyMeasure)
                                    .font(.custom("Futura", size: geometry.size.width/35))
                                    .foregroundColor(Color("ColorText"))
                                    .padding(.trailing, geometry.size.width/17)
                                
                                HStack {
                                    ForEach(0..<cardModel.energyImage.count) { index in
                                        Image(cardModel.energyImage[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geometry.size.width/16)
                                    }
                                    
                                }
                                
                            }
                        } .padding(.trailing, geometry.size.width/10)
                        
                    }
                }.frame(width: geometry.size.width)
            }
        }
    }
}



//struct CardView: View {
//
//    var cardModel: CardModel
//    @Binding var showModal: Bool
//
//    var body: some View {
//        VStack {
//            ZStack {
//                RoundedRectangle(cornerRadius: 30, style: .circular)
//                    .foregroundColor(.white)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 30)
//                            .stroke(Color("ColorText"), lineWidth: 2)
//                    )
//                    .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height/4.5)
//
//                HStack {
//                    Group {
//                        VStack {
//                            Text(cardModel.waveName)
//                                .font(.custom("Futura", size: 26))
//                                .foregroundColor(Color("ColorText"))
//
//                            Image(cardModel.waveImage)
//                        }
//                    }
//                    .padding(.leading, 180)
//
//                    Group{
//                        VStack{
//                            Text(cardModel.waveLength)
//
//                                .font(.custom("Futura", size: 35))
//                                .foregroundColor(Color("ColorText"))
//                                .padding(.leading, 46)
//                                .padding(-5)
//
//                            Text(cardModel.energyMeasure)
//                                .font(.custom("Futura", size: 35))
//                                .foregroundColor(Color("ColorText"))
//                                .padding(.leading, 60)
//
//                            HStack{
//                                ForEach(0..<cardModel.energyImage.count) { index in
//                                    Image(cardModel.energyImage[index])
//                                }
//                            }
//                            .padding(.leading, 40)
//                        }
//                        .padding(.leading, 60)
//                        Spacer()
//                    }
//                    Button {
//                        showModal = false
//                    } label: {
//                        Image(systemName: "x.circle.fill")
//                            .foregroundColor(Color("ColorText"))
//                            .font(.system(size: 30))
//                    }
//                    .padding(.trailing, 120)
//                    .padding(.bottom, 220)
//                }
//            }
//        }
//    }
//}
