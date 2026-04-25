//
//  DetailView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

struct DetailView: View {
    let scooter: CygnusModel
    let darkBg = Color(red: 0.05, green: 0.05, blue: 0.1)

    // 延續多圖自動生成的邏輯，作為頂部的 Hero Image 輪播
    var displayImages: [String] {
        [
            scooter.imageName,
            "\(scooter.imageName)_2",
            "\(scooter.imageName)_3",
        ]
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {

                // 1. 頂部照片輪播 (Hero Image)
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

                // 2. 內容區塊
                VStack(alignment: .leading, spacing: 24) {

                    // 標題與年份標籤
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

                    // Slogan 與 敘述
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

                    // 3. 玻璃感規格卡片 (與 ComparisonView 一致的語彙)
                    VStack(alignment: .leading, spacing: 16) {
                        Text("KEY SPECIFICATIONS")
                            .font(.system(size: 16, weight: .black))
                            .foregroundColor(.white)
                            .kerning(1)

                        Divider().background(Color.gray.opacity(0.4))

                        // 沿用我們寫好的排版小工具
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
        .background(darkBg.ignoresSafeArea())
        .navigationTitle("\(scooter.generation) \(scooter.name)")
        // ✨ 在詳細頁面通常建議用 .inline，讓標題縮小置中，留更多空間給內容
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)  // 延續白字設定
        // --- 導覽列設定 ---
        .navigationBarTitleDisplayMode(.inline)
        // 關鍵：確保返回按鈕 (< Back) 在深色背景上會自動變成白色
    }
}

// MARK: - 專用排版小工具 (讓標題與數值整齊對齊)
struct DetailSpecRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(width: 70, alignment: .leading)  // 固定標題寬度

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
