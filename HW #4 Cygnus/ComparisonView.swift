//
//  ComparisonView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

// MARK: - 1. 定義規格的分頁類別 (加入 "車系總覽")
enum SpecCategory: String, CaseIterable {
    case overview = "車系總覽"  // 第一頁 List 入口
    case engine = "引擎與動力"
    case dimensions = "車身尺寸"
    case chassis = "制動系統"
    case electronics = "電子配備"
    case lighting = "燈具規格"
}

// MARK: - 2. 全新設計的規格比較分頁視圖
struct ComparisonView: View {
    let scooters: [CygnusModel]

    // 漸層背景

    var body: some View {
        let bgGradient = LinearGradient(
            gradient: Gradient(colors: [.yamahaBlue, .darkBg]),
            startPoint: .top,
            endPoint: .bottom
        )

        NavigationStack {
            TabView {
                ForEach(SpecCategory.allCases, id: \.self) { category in
                    if category == .overview {
                        ModelListView(scooters: scooters)
                    } else {
                        SpecPageView(category: category, scooters: scooters)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .background(bgGradient.ignoresSafeArea())
            .navigationTitle("車系總覽")
            .navigationBarTitleDisplayMode(.large)
            .toolbarColorScheme(.dark, for: .navigationBar)  // 標題白字
            .toolbarBackground(.hidden, for: .navigationBar)
            .environment(\.colorScheme, .dark)
        }
    }
}

// MARK: - 3. 總覽清單頁 (使用原生 List + 圓角微光設計)
struct ModelListView: View {
    let scooters: [CygnusModel]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                ForEach(scooters) { scooter in
                    NavigationLink(destination: DetailView(scooter: scooter)) {
                        DetailRow(scooter: scooter)
                    }
                    // List with ultraThinMaterial
                    .listRowBackground(
                        ZStack {
                            Color.black.opacity(0.1)
                            Rectangle().fill(.ultraThinMaterial)
                        }
                    )
                    // 分隔線顏色
                    .listRowSeparatorTint(Color.white.opacity(0.2))
                }
            }
            .listStyle(.insetGrouped)
            // 隱藏預設背景
            .scrollContentBackground(.hidden)
        }
    }
}

// MARK: - 4. 單一規格分頁 (完全保留原設計)
struct SpecPageView: View {
    let category: SpecCategory
    let scooters: [CygnusModel]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 大標題
            Text(category.rawValue)
                .font(.system(size: 25, weight: .black))
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 20)

            // 歷代規格
            ScrollView(showsIndicators: false) {
                VStack(spacing: 12) {
                    ForEach(scooters) { scooter in
                        SpecRowCard(scooter: scooter, category: category)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 80)
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
            // Generation tag
            VStack(alignment: .leading, spacing: 4) {
                Text("\(scooter.generation)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(scooter.themeColor)  // 使用該代的代表色

                Text(scooter.years.prefix(4))  // 只取年份前4碼
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(width: 75, alignment: .leading)

            Divider()
                .background(Color.gray.opacity(0.4))
                .frame(height: 30)

            // Spec description
            Text(specContent)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white.opacity(0.9))
                .lineLimit(2)
                .minimumScaleFactor(0.8)

            Spacer()
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        // 左側色彩邊條
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
            return "" 

        case .engine:
            return scooter.engine

        case .chassis:
            return scooter.brake

        case .lighting:
            if scooter.generation == "第一代" || scooter.generation == "第二代" {
                return "H4 傳統鹵素大燈 / 鹵素方向燈"
            } else if scooter.generation == "第三代" || scooter.generation == "第四代"
            {
                return "H4 鹵素大燈 / LED 定位燈與尾燈"
            } else if scooter.generation == "第五代" || scooter.generation == "第六代"
            {
                return "全車 LED 燈具 (搭配反射式頭燈)"
            } else if scooter.generation == "第七代" {
                return "全車 LED 燈具 (含方向燈，搭配魚眼式頭燈)"
            } else {
                return "規格未確認"
            }

        case .electronics:
            if scooter.generation == "第七代" {
                return "標配 TCS 循跡防滑系統（ABS 視等級配備）/ 全數位儀表"
            } else if scooter.generation == "第六代" {
                return """
                    ABS＋TCS (視等級配備) / \nTFT 智慧儀表或高反差數位儀表
                    """
            } else if scooter.generation == "第五代" {
                return "ABS 防鎖死煞車系統 (視等級配備) / 全數位儀表"
            } else if scooter.generation == "第二代" || scooter.generation == "第三代"
                || scooter.generation == "第四代"
            {
                return "FI 噴射供油系統 / \n液晶指針混合式儀表"
            } else {
                return "無特殊電控輔助 / 傳統機械表"
            }

        case .dimensions:
            return scooter.size
        }
    }
}

#Preview {
    ComparisonView(scooters: [
        CygnusModel(
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
    ])
}
