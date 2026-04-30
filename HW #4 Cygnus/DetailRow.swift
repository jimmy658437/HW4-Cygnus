//
//  DetailRow.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

struct DetailRow: View {
    let scooter: CygnusModel
    
    var body: some View {
        HStack(spacing: 16) {
            // 左側縮圖
            Image(scooter.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                )
            
            // 右側文字資訊
            VStack(alignment: .leading, spacing: 4) {
                Text(scooter.generation)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white.opacity(0.6))
                
                Text(scooter.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(scooter.years)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    DetailRow(
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
