//
//  MainTabView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

struct MainTabView: View {
    // 整合連結中 1-7 代的完整資料
    let scooters: [CygnusModel] = [
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
        ),
        CygnusModel(
            generation: "第二代",
            name: "Cygnus-X 新勁戰",
            years: "2006 - 2012",
            slogan: "進化靈魂 噴射時代",
            themeColor: .cyan,
            description: "外型更為大器，並全面導入噴射供油系統 (FI)，儀表板結合指針與數位顯示。",
            engine: "氣冷 4V 噴射引擎",
            brake: "前碟後鼓",
            cardGenerationTitle: "2nd Gen",
            cardSubTitle: "Precision FI",
            imageName: "cygnus_gen2",
            yearsLabel: "2006 - 2012",
            additionalTag: "FI INTRODUCED",
            specTitle1: "HEADLIGHT",
            specValue1: "H4 Halogen",
            specTitle2: "DASHBOARD",
            specValue2: "Digital/Analog"
        ),
        CygnusModel(
            generation: "第三代",
            name: "Cygnus-X",
            years: "2012 - 2015",
            slogan: "美學與性能的平衡",
            themeColor: .orange,
            description: "優化車架剛性，並在燈具與進氣口設計上融入跑車美學，首度加入 LED 定位燈。",
            engine: "氣冷 4V 噴射引擎",
            brake: "前碟後鼓 (優化制動)",
            cardGenerationTitle: "3rd Gen",
            cardSubTitle: "Aggressive Posture",
            imageName: "cygnus_gen3",
            yearsLabel: "2012 - 2015",
            additionalTag: nil,
            specTitle1: "POSITION LIGHTS",
            specValue1: "LED Strip",
            specTitle2: "BRAKING",
            specValue2: "Front Disc"
        ),
        CygnusModel(
            generation: "第四代",
            name: "Cygnus-X",
            years: "2015 - 2018",
            slogan: "雙碟進化 穩定操控",
            themeColor: .red,
            description: "首度搭載後輪碟煞系統，操控更穩定。大燈與尾燈皆改為更具辨識度的 LED 設計。",
            engine: "氣冷 4V 噴射引擎",
            brake: "前後雙碟煞",
            cardGenerationTitle: "4th Gen",
            cardSubTitle: "Dual Disc",
            imageName: "cygnus_gen4",
            yearsLabel: "2015 - 2018",
            additionalTag: "DUAL DISC",
            specTitle1: "TAILLIGHT",
            specValue1: "LED Light Guide",
            specTitle2: "BRAKING",
            specValue2: "Front & Rear Disc"
        ),
        CygnusModel(
            generation: "第五代",
            name: "Cygnus-X",
            years: "2018 - 2020",
            slogan: "ABS 安全守護",
            themeColor: .blue,
            description: "導入 BOSCH ABS 防鎖死煞車系統，搭配全新反射式 LED 大燈，安全科技感大幅提升。",
            engine: "氣冷 4V 噴射引擎",
            brake: "ABS / 前後雙碟",
            cardGenerationTitle: "5th Gen",
            cardSubTitle: "ABS Safety",
            imageName: "cygnus_gen5",
            yearsLabel: "2018 - 2020",
            additionalTag: "ABS STD",
            specTitle1: "HEADLIGHT",
            specValue1: "Reflector LED",
            specTitle2: "SAFETY",
            specValue2: "Bosch ABS 10"
        ),
        CygnusModel(
            generation: "第六代",
            name: "Cygnus Gryphus",
            years: "2020 - 2024",
            slogan: "水冷革新 神鵝降臨",
            themeColor: .gray,
            description: "車系歷史上最大變革，換裝全新 Blue Core 水冷引擎並搭載 VVA 可變汽門，動力大幅躍進。",
            engine: "水冷 4V VVA 引擎",
            brake: "ABS / 前後雙碟",
            cardGenerationTitle: "6th Gen",
            cardSubTitle: "Liquid Cooled",
            imageName: "cygnus_gen6",
            yearsLabel: "2020 - 2024",
            additionalTag: "VVA TECHNOLOGY",
            specTitle1: "ENGINE",
            specValue1: "Liquid-Cooled VVA",
            specTitle2: "FRAME",
            specValue2: "Asymmetric Frame"
        ),
        CygnusModel(
            generation: "第七代",
            name: "Cygnus XR",
            years: "2025 - 至今",
            slogan: "越級動力 絕對主宰",
            themeColor: .red,
            description: "外型強烈大改款，極度強調運動跑格。電控系統升級，標配 TCS 循跡防滑系統確保頂級操控。",
            engine: "優化水冷 VVA 引擎",
            brake: "ABS / TCS 循跡系統",
            cardGenerationTitle: "7th Gen",
            cardSubTitle: "Peak Dynamics",
            imageName: "cygnus_gen7",
            yearsLabel: "2025 - Present",
            additionalTag: "TCS STD",
            specTitle1: "ELECTRONICS",
            specValue1: "TCS Equipped",
            specTitle2: "DISPLAY",
            specValue2: "TFT Smart Dash"
        )
    ]
    
    var body: some View {
        TabView {
            // Tab 1: 圖鑑 (卡片滑動)
            HistoryView(scooters: scooters)
                .tabItem {
                    Label("圖鑑", systemImage: "book.fill")
                }
            
            // Tab 2: 規格 (清單比較)
            ComparisonView(scooters: scooters)
                .tabItem {
                    Label("規格", systemImage: "list.bullet.rectangle.portrait")
                }
            
            // Tab 3: 品牌 (關於)
            AboutView()
                .tabItem {
                    Label("品牌", systemImage: "info.circle.fill")
                }
        }
    }
}


#Preview {
    MainTabView()
}
