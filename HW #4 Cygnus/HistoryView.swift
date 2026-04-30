//
//  HistoryView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

struct HistoryView: View {
    let scooters: [CygnusModel]
        
    var body: some View {
        let bgGradient = LinearGradient(
            gradient: Gradient(colors: [.yamahaBlue, .darkBg]),
            startPoint: .top,
            endPoint: .center
        )
        
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(.cygnusxLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 35)
                }
                
                Text("有路就有勁戰 - 20 餘年的經典")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.top, 40)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 24) {
                    ForEach(scooters) { scooter in
                        CygnusCardView(scooter: scooter)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
        }
        .background(bgGradient.ignoresSafeArea())
    }
}



#Preview {
    HistoryView(scooters: [
        CygnusModel(
            generation: "第一代",
            name: "Cygnus-X",
            years: "2002 - 2006",
            slogan: "12吋雙槍 破局而生",
            themeColor: .blue,
            description: "開創台灣運動型速克達 12 吋胎與雙槍避震的黃金年代。",
            engine: "氣冷 4V 化油器",
            brake: "前碟後鼓",
            cardGenerationTitle: "1st Gen",
            cardSubTitle: "The Origin",
            imageName: "cygnus_gen1",
            yearsLabel: "2002 - 2006",
            additionalTag: nil,
            specTitle1: "ENGINE",
            specValue1: "125cc Air-Cooled",
            specTitle2: "FUEL SYSTEM",
            specValue2: "Carburetor"
        )
    ])
}
