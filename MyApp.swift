import SwiftUI

@available(iOS 16.0, *)
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            //            CardView(cardModel: CardModel(waveName: "X-Ray Machine", waveImage: "waveXray", waveLength: "Length: ", energyMeasure: "Energy:", energyImage: "lightBulbOn"), showModal: $showModal)
            EnvironmentView()
        }
    }
}
