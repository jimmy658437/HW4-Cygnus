//
//  DetailView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

struct DetailView: View {
    let scooter: CygnusModel

    var displayImages: [String] {
        [
            scooter.imageName,
            "\(scooter.imageName)_2",
            "\(scooter.imageName)_3",
        ]
    }

    var body: some View {
        
        let bgDetailGradient = LinearGradient(
            gradient: Gradient(colors: [scooter.themeColor.opacity(0.9), .yamahaBlue.opacity(0.9)]),
            startPoint: UnitPoint(x: 0.2, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 0.7)
        )
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {

                // 照片
                TabView {
                    ForEach(displayImages, id: \.self) { imgName in
                        Image(imgName)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 320)
                            .clipped()
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 320)

                // 內容
                VStack(alignment: .leading, spacing: 24) {

                    // 標題與年份
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(scooter.generation)
                                .font(.system(size: 38, weight: .black))
                                .foregroundColor(.white)
                            Text(scooter.name)
                                .font(.title3)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        Text(scooter.yearsLabel)
                            .font(.caption).bold()
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .background(
                                Capsule().stroke(
                                    Color.white.opacity(0.6),
                                    lineWidth: 1
                                )
                            )
                            .foregroundColor(.white)
                            .padding(.top, 8)
                    }

                    // 敘述
                    VStack(alignment: .leading, spacing: 12) {
                        Text(scooter.slogan)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(scooter.themeColor)  // 使用該代的專屬色

                        Text(scooter.description)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.85))
                            .lineSpacing(6)  // 增加行距，讓閱讀更舒適
                    }

                    // 規格
                    VStack(alignment: .leading, spacing: 16) {
                        Text("KEY SPECIFICATIONS")
                            .font(.system(size: 16, weight: .black))
                            .foregroundColor(.white)
                            .kerning(1)

                        Divider().background(Color.gray.opacity(0.4))

                        DetailSpecRow(title: "引擎動力", value: scooter.engine)
                        DetailSpecRow(title: "制動系統", value: scooter.brake)
                        DetailSpecRow(
                            title: scooter.specTitle1,
                            value: scooter.specValue1
                        )
                        DetailSpecRow(
                            title: scooter.specTitle2,
                            value: scooter.specValue2
                        )
                    }
                    .padding(20)
                    .background(Color.white.opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white.opacity(0.1), lineWidth: 1)
                    )
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .background(bgDetailGradient.ignoresSafeArea())
        .navigationTitle("\(scooter.generation) \(scooter.name)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailSpecRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(width: 70, alignment: .leading)

            Text(value)
                .font(.subheadline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    DetailView(
        scooter: CygnusModel(
            generation: "第三代",
            name: "Cygnus-X",
            years: "2012 - 2015",
            slogan: "美學與性能的平衡",
            themeColor: .orange,
            description:"""
                邁入第三世代，勁戰回歸運動風格，分離式頭燈導入LED定位燈，車殼設計流暢洗練，遠看與第一代神韻極為近似。
                三代勁戰內藏不少優化細節，例如採用新版卡鉗、加大 12% 煞車皮尺寸、縮短煞車油管長度 15% ，制動效果因此進步 19%。輕量化碟盤、前叉阻尼調整、新版後避震器，操控感有所升級。加上車體輕量化 3%、外觀部品與燈具組減重 5% 與 3%，還有傳動系統調整、排氣管內部，運動化工程範圍有內有外、表裡一致。
                """,
            engine: "氣冷 4V 噴射引擎 (代號 5ML)",
            brake: "前：碟煞 (優化制動) \n後：鼓煞 (優化制動)",
            cardGenerationTitle: "3",
            cardSubTitle: "回歸洗練設計",
            imageName: "cygnus_gen3",
            yearsLabel: "2012 - 2015",
            additionalTag: nil,
            specTitle1: "定位燈",
            specValue1: "LED 光條",
            specTitle2: "輕量化工程",
            specValue2: "車體輕量化 3%"
        )
    )
}
