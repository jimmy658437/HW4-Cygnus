//
//  CygnusCardView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

struct CygnusCardView: View {
    let scooter: CygnusModel

    var displayImages: [String] {
        [
            scooter.imageName,
            "\(scooter.imageName)_2",
            "\(scooter.imageName)_3",
        ]
    }

    var body: some View {
        VStack(spacing: 0) {

            // --- 上半部：圖片與大標題區塊 ---
            ZStack {
                TabView {
                    ForEach(displayImages, id: \.self) { imgName in
                        ZStack {
                            Image(imgName)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .frame(height: 240)
                                .clipped()

                            // 圖片下方的漸層，用來承接下方的毛玻璃
                            LinearGradient(
                                colors: [
                                    .clear, .black.opacity(0.3),
                                    .black.opacity(0.8),
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 250)

                VStack(alignment: .leading) {
                    HStack {
                        // ✨ 明確加上 .foregroundColor(.white) 讓年份變成淺白字
                        Text(scooter.yearsLabel)
                            .font(.caption).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 10).padding(.vertical, 4)
                            .background(
                                Capsule().stroke(
                                    Color.white.opacity(0.6),
                                    lineWidth: 1
                                )
                            )

                        if let tag = scooter.additionalTag {
                            Text(tag)
                                .font(.caption2).bold().foregroundColor(.white)
                                .padding(.horizontal, 8).padding(.vertical, 4)
                                .background(
                                    Capsule().fill(Color.white.opacity(0.2))
                                )
                        }
                        Spacer()
                    }

                    Spacer()

                    HStack(alignment: .lastTextBaseline, spacing: 6) {
                        Text(scooter.cardGenerationTitle)
                            .font(.system(size: 32, weight: .black))
                            .foregroundColor(.white)

                        Text("- \(scooter.cardSubTitle)")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .padding(.bottom, 24)
                }
                .padding()
                .allowsHitTesting(false)
            }
            .frame(height: 240)

            // --- 下半部：規格區塊 ---
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(scooter.specTitle1)
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.white.opacity(0.6))
                        .kerning(1)
                    Text(scooter.specValue1)
                        .font(.headline)
                        .foregroundColor(.white)
                }

                Divider()
                    .background(Color.white.opacity(0.2))
                    .frame(height: 30)

                VStack(alignment: .leading, spacing: 4) {
                    Text(scooter.specTitle2)
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.white.opacity(0.6))
                        .kerning(1)
                    Text(scooter.specValue2)
                        .font(.headline)
                        .foregroundColor(.white)
                }

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
        }
        // ✨ 色彩遮罩 + 毛玻璃的核心組合
        .background(
            ZStack {
                // 1. 基底毛玻璃
                Rectangle()
                    .fill(.ultraThinMaterial)

                // 2. 協調的色彩遮罩 (深黑 + 微量 Yamaha 藍)
                Color.black.opacity(0.25)
                Color(red: 0 / 255.0, green: 32 / 255.0, blue: 130 / 255.0)
                    .opacity(0.15)
            }
        )
        // 確保系統將這塊毛玻璃視為「深色模式」處理，字體渲染會更漂亮
        .environment(\.colorScheme, .dark)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        // 玻璃邊緣的反光線
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    CygnusCardView(
        scooter: CygnusModel(
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
    )
}
