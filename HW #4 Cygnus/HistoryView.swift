//
//  HistoryView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

// MARK: - 1. 歷史圖鑑首頁主視圖
struct HistoryView: View {
    let scooters: [CygnusModel]
    
    let darkBg = Color(red: 0.05, green: 0.05, blue: 0.1)
    let yamahaBlue = Color(red: 0 / 255.0, green: 32 / 255.0, blue: 130 / 255.0)
    
    var body: some View {
        let bgGradient = LinearGradient(
            gradient: Gradient(colors: [yamahaBlue, darkBg]),
            startPoint: .top,
            endPoint: .center
        )
        
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 10) {
                Text("HISTORY")
                    .font(.system(size: 38, weight: .black))
                Text("Evolution of a performance icon.")
                    .font(.subheadline)
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
                        HistoryCardView(scooter: scooter)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
        }
        .background(bgGradient.ignoresSafeArea())
    }
}

// MARK: - 2. 支援多圖水平滑動的卡片視圖
struct HistoryCardView: View {
    let scooter: CygnusModel
    
    var displayImages: [String] {
        [
            scooter.imageName,
            "\(scooter.imageName)_2",
            "\(scooter.imageName)_3"
        ]
    }
    
    var body: some View {
        // 視覺設計：將卡片分為上下兩個區塊
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
                                .frame(height: 240) // 稍微縮減高度，留給下方規格區
                                .clipped()
                            
                            LinearGradient(
                                colors: [.clear, .black.opacity(0.4), .black.opacity(0.9)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 240)
                
                VStack(alignment: .leading) {
                    // 左上角標籤
                    HStack {
                        Text(scooter.yearsLabel)
                            .font(.caption).bold()
                            .padding(.horizontal, 10).padding(.vertical, 4)
                            .background(Capsule().stroke(Color.white.opacity(0.8), lineWidth: 1))
                            .shadow(color: .black.opacity(0.5), radius: 2)
                        
                        if let tag = scooter.additionalTag {
                            Text(tag)
                                .font(.caption2).bold().foregroundColor(.white)
                                .padding(.horizontal, 8).padding(.vertical, 4)
                                .background(Capsule().fill(Color.gray.opacity(0.8)))
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    
                    // 大標題
                    HStack(alignment: .lastTextBaseline, spacing: 6) {
                        Text(scooter.cardGenerationTitle)
                            .font(.system(size: 32, weight: .black))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.6), radius: 2, x: 0, y: 1)
                        
                        Text("- \(scooter.cardSubTitle)")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white.opacity(0.85))
                            .shadow(color: .black.opacity(0.6), radius: 2, x: 0, y: 1)
                    }
                    .padding(.bottom, 24) // 往上推一點，避開小圓點
                }
                .padding()
                .allowsHitTesting(false)
            }
            .frame(height: 240)
            
            // --- 下半部：規格區塊 (自己獨立一塊，跟圖片分開) ---
            HStack(spacing: 20) {
                // 第一組規格：直接使用 MainTabView 傳進來的資料
                VStack(alignment: .leading, spacing: 4) {
                    Text(scooter.specTitle1)
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.gray)
                        .kerning(1)
                    Text(scooter.specValue1)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .background(Color.gray.opacity(0.4))
                    .frame(height: 30)
                
                // 第二組規格
                VStack(alignment: .leading, spacing: 4) {
                    Text(scooter.specTitle2)
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.gray)
                        .kerning(1)
                    Text(scooter.specValue2)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            // 給這個獨立區塊一個深色的底
            .background(Color(white: 0.12))
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 5)
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
