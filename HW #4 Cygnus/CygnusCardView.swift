//
//  CygnusCardView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

struct CygnusCardView: View {
    let scooter: CygnusModel
    
    var body: some View {
        ZStack {
            // 底層圖片：直接讀取你放在 Assets 的圖片
            Image(scooter.imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                .clipped()
            
            // 深色半透明遮罩，使文字更清晰
            Color.black.opacity(0.6)
            
            // 文字內容排版
            VStack(alignment: .leading) {
                // 上方膠囊標籤 (年份, 特殊標記)
                HStack {
                    Text(scooter.yearsLabel)
                        .font(.caption)
                        .bold()
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .stroke(Color.white.opacity(0.6), lineWidth: 1)
                        )
                    
                    // 這裡的 if let 保留，因為不一定每一代都有額外標籤（如 FI / ABS）
                    if let additionalTag = scooter.additionalTag {
                        Text(additionalTag)
                            .font(.caption2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(
                                Capsule()
                                    .fill(Color.gray.opacity(0.8))
                            )
                    }
                    Spacer()
                }
                
                Spacer() // 將大標題推到底部
                
                // 卡片主大標題 (世代 + 副標題)
                HStack(alignment: .lastTextBaseline, spacing: 5) {
                    Text(scooter.cardGenerationTitle)
                        .font(.system(size: 32, weight: .bold))
                    Text("- \(scooter.cardSubTitle)")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.bottom, 20)
                
                // 底部垂直規格區塊
                HStack(spacing: 20) {
                    // 規格 1
                    VStack(alignment: .leading, spacing: 4) {
                        Text(scooter.specTitle1)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                            .kerning(1) // 增加字元間距
                        Text(scooter.specValue1)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                        .background(Color.gray.opacity(0.3))
                        .frame(height: 30)
                    
                    // 規格 2
                    VStack(alignment: .leading, spacing: 4) {
                        Text(scooter.specTitle2)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                            .kerning(1)
                        Text(scooter.specValue2)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
            }
            .foregroundColor(.white)
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    CygnusCardView(scooter: CygnusModel(
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
    ))
}
