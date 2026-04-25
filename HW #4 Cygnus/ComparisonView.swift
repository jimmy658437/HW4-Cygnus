//
//  ComparisonView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

// MARK: - 1. 定義規格的分頁類別 (加入 "車系總覽")
enum SpecCategory: String, CaseIterable {
    case overview = "車系總覽" // 第一頁 List 入口
    case engine = "引擎與動力"
    case chassis = "制動與底盤"
    case lighting = "燈具設備"
    case electronics = "電控系統"
    case dimensions = "車身尺寸"
}

// MARK: - 2. 全新設計的規格比較分頁視圖
struct ComparisonView: View {
    let scooters: [CygnusModel]
    
    // 全局漸層背景色
    let darkBg = Color(red: 0.05, green: 0.05, blue: 0.1)
    let yamahaBlue = Color(red: 0 / 255.0, green: 32 / 255.0, blue: 130 / 255.0)
    
    var body: some View {
        let bgGradient = LinearGradient(
            gradient: Gradient(colors: [yamahaBlue, darkBg]),
            startPoint: .top,
            endPoint: .bottom
        )
        
        NavigationStack {
            ZStack {
                // 套用全局漸層背景
                bgGradient.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // 👇 替換成與 HistoryView 完全一致的大標題排版
                    VStack(alignment: .leading, spacing: 10) {
                        Text("SPECIFICATIONS")
                            .font(.system(size: 38, weight: .black))
                        Text("Compare technical details across generations.")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // 水平滑動分頁區塊
                    TabView {
                        ForEach(SpecCategory.allCases, id: \.self) { category in
                            if category == .overview {
                                // 👇 第一頁：套用全新設計的原生圓角 List 總覽
                                ModelListView(scooters: scooters)
                            } else {
                                // 👇 其他頁：維持你原本的規格卡片設計
                                SpecPageView(category: category, scooters: scooters)
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                }
            }
            .environment(\.colorScheme, .dark) // 強制深色模式讓 List 渲染更乾淨
        }
    }
}

// MARK: - 3. 總覽清單頁 (使用原生 List + 圓角微光設計)
struct ModelListView: View {
    let scooters: [CygnusModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("車系總覽")
                .font(.system(size: 32, weight: .black))
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 10)
            
            List {
                ForEach(scooters) { scooter in
                    NavigationLink(destination: DetailView(scooter: scooter)) {
                        // 呼叫獨立出來的 DetailRow
                        DetailRow(scooter: scooter)
                    }
                    // ✨ 讓 List 的每一列變成微光毛玻璃
                    .listRowBackground(
                        ZStack {
                            Color.black.opacity(0.1) // 打個暗底
                            Rectangle().fill(.ultraThinMaterial) // 上毛玻璃
                        }
                    )
                    // 設定分隔線的顏色
                    .listRowSeparatorTint(Color.white.opacity(0.2))
                }
            }
            // ✨ 關鍵 1：原生大圓角群組樣式
            .listStyle(.insetGrouped)
            // ✨ 關鍵 2：隱藏預設背景，讓底層 Yamaha 藍透出來
            .scrollContentBackground(.hidden)
//            .padding(.bottom, 50)
        }
    }
}



// MARK: - 4. 單一規格分頁 (完全保留原設計)
struct SpecPageView: View {
    let category: SpecCategory
    let scooters: [CygnusModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 該分頁的大標題
            Text(category.rawValue)
                .font(.system(size: 32, weight: .black))
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 20)
            
            // 垂直滾動歷代規格
            ScrollView(showsIndicators: false) {
                VStack(spacing: 12) {
                    ForEach(scooters) { scooter in
                        SpecRowCard(scooter: scooter, category: category)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 80) // 給下方分頁小圓點留空間
            }
        }
    }
}

// MARK: - 5. 單一代數的規格卡片 (完全保留原設計)
struct SpecRowCard: View {
    let scooter: CygnusModel
    let category: SpecCategory
    
    var body: some View {
        HStack(spacing: 15) {
            // 左側：世代標籤
            VStack(alignment: .leading, spacing: 4) {
                Text(scooter.cardGenerationTitle)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(scooter.themeColor) // 使用該代的代表色
                
                Text(scooter.yearsLabel.prefix(4)) // 只取年份前4碼
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(width: 75, alignment: .leading)
            
            // 分隔線
            Divider()
                .background(Color.gray.opacity(0.4))
                .frame(height: 30)
            
            // 右側：規格細節
            Text(specContent)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white.opacity(0.9))
                .lineLimit(2)
                .minimumScaleFactor(0.8)
            
            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.05)) // 微亮的深色卡片底
        .clipShape(RoundedRectangle(cornerRadius: 12))
        // 左側加上一個微小的顏色邊條，增加視覺層次
        .overlay(
            Rectangle()
                .fill(scooter.themeColor)
                .frame(width: 4),
            alignment: .leading
        )
    }
    
    // 根據當前分頁類別，回傳對應的文字資料
    var specContent: String {
        switch category {
        case .overview:
            return "" // 總覽頁不會渲染這張卡片，所以回傳空字串即可
            
        case .engine:
            return scooter.engine
            
        case .chassis:
            return scooter.brake
            
        case .lighting:
            if scooter.generation == "第一代" || scooter.generation == "第二代" {
                return "H4 傳統鹵素大燈 / 鹵素方向燈"
            } else if scooter.generation == "第三代" || scooter.generation == "第四代" {
                return "H4 鹵素大燈 / LED 定位燈與尾燈"
            } else {
                return "全車高亮度 LED 燈具 (反射式/魚眼)"
            }
            
        case .electronics:
            if scooter.generation == "第七代" {
                return "TCS 循跡防滑系統 / 智慧 TFT 儀表"
            } else if scooter.generation == "第五代" || scooter.generation == "第六代" {
                return "BOSCH ABS 防鎖死系統 / 全數位儀表"
            } else if scooter.generation == "第二代" {
                return "FI 噴射供油電腦 / 液晶指針雙載儀表"
            } else {
                return "無特殊電控輔助 / 傳統機械表"
            }
            
        case .dimensions:
            if scooter.generation == "第六代" || scooter.generation == "第七代" {
                return "前 120/70-12 | 後 130/70-12 (不對稱車架)"
            } else {
                return "前 110/70-12 | 後 120/70-12 (雙槍避震)"
            }
        }
    }
}

#Preview {
    ComparisonView(scooters: [
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
