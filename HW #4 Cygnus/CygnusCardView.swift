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

            // 上半部：圖片與大標題區塊
            ZStack {
                TabView {
                    ForEach(displayImages, id: \.self) { imgName in
                        ZStack {
                            Image(imgName)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .frame(height: 240)
                                .clipped()

                            // 圖片下方的漸層
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
                        Text("0\(scooter.cardGenerationTitle)")
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

            // 下半部：規格區塊
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
        .background(
            ZStack {
                Rectangle()
                    .fill(.ultraThinMaterial)
                Color.black.opacity(0.25)
                Color(red: 0 / 255.0, green: 32 / 255.0, blue: 130 / 255.0)
                    .opacity(0.15)
            }
        )
        .environment(\.colorScheme, .dark)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        // 邊緣白線
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
            slogan: "「勁戰」誕生",
            themeColor: .gray,
            description: """
                2002年，台灣山葉發表第一代 Cygnus-X 125，可動式車頭、H4規格頭燈、前後12吋輪胎、雙槍後避震器、為求均衡配重而存在的前置電瓶，開創台灣運動型速克達 12 吋胎與雙槍避震的道路。
                前衛的 Cygnus-X 並沒有一上市就轟動，而是等到2004年首次小改(SR版本) 導入活潑的雙配色，甚至下猛藥限量發售Rossi限量版！更重要的是啟用中文車名「勁戰」才迎來銷售爆發。由此可見，接地氣比高大上更有效用。
                """,
            engine: "氣冷 4V 化油器 (代號 5ML)",
            brake: "前：碟煞 後：鼓煞",
            size: """
                軸距：1295mm
                尺寸：1855 x 685 x 1110 mm
                座椅高度：770mm
                """,
            cardGenerationTitle: "1",
            cardSubTitle: "起源",
            imageName: "cygnus_gen1",
            yearsLabel: "2002 - 2006",
            additionalTag: nil,
            specTitle1: "引擎",
            specValue1: "4V 氣冷 125cc ",
            specTitle2: "避震器",
            specValue2: "雙槍後避震"
        )
    )
}
