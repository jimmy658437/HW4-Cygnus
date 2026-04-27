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
            slogan: "「勁戰」誕生",
            themeColor: .blue,
            description: """
                2002年，台灣山葉發表第一代 Cygnus-X 125，可動式車頭、H4規格頭燈、前後12吋輪胎、雙槍後避震器、為求均衡配重而存在的前置電瓶，開創台灣運動型速克達 12 吋胎與雙槍避震的道路。
                前衛的 Cygnus-X 並沒有一上市就轟動，而是等到2004年首次小改(SR版本) 導入活潑的雙配色，甚至下猛藥限量發售Rossi限量版！更重要的是啟用中文車名「勁戰」才迎來銷售爆發。由此可見，接地氣比高大上更有效用。
                """,
            engine: "氣冷 4V 化油器 (代號 5ML)",
            brake: "前：碟煞 後：鼓煞",
            cardGenerationTitle: "1",
            cardSubTitle: "起源",
            imageName: "cygnus_gen1",
            yearsLabel: "2002 - 2006",
            additionalTag: nil,
            specTitle1: "引擎",
            specValue1: "4V 氣冷 125cc ",
            specTitle2: "避震器",
            specValue2: "雙槍後避震"
        ),
        CygnusModel(
            generation: "第二代",
            name: "Cygnus-X",
            years: "2006 - 2012",
            slogan: "實用至上、導入五期電子噴射",
            themeColor: .cyan,
            description: """
                二代勁戰是台灣設計師參與的新車款，更符合存在感強烈、實用性至上的理念。
                從此之後，勁戰開始車體大型化、儀錶數位化，電瓶移往後方、前面多出置杯置物空間，後座乘客獲得飛旋腳踏板(2010年起)。
                二代勁戰的重點是動力電子噴射化，因應新世代環保法規，2008年勁戰發表搭載含氧感知器的五期電子噴射車型，從此邁入電噴時代。從類比化油器步入數位電噴，二代勁戰見證了速可達動力演進。
                """ ,
            engine: "氣冷 4V 化油器／噴射引擎 (代號 5ML)",
            brake: "前：碟煞 \n後：鼓煞",
            cardGenerationTitle: "2",
            cardSubTitle: "五期噴射引擎導入",
            imageName: "cygnus_gen2",
            yearsLabel: "2006 - 2012",
            additionalTag: "FI 噴射引擎",
            specTitle1: "設計",
            specValue1: "實用進化",
            specTitle2: "儀表板",
            specValue2: "數位＋指針混合式"
        ),
        CygnusModel(
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
        ),
        CygnusModel(
            generation: "第四代",
            name: "Cygnus-X",
            years: "2015 - 2018",
            slogan: "前後碟煞，操控進化",
            themeColor: .red,
            description: """
                第四代勁戰改用前後碟煞是最大亮點，後輪從鼓煞變成碟煞，耐熱性與制動性一一提升，並增添視覺俐落感。
                此外，四代勁戰的前後輪框、三角台、後搖臂、車架等剛性結構都是重新設計、能夠以降低簧下重量的輕量化好料。動力方面，三代勁戰凸輪軸重新設計過，常用轉速域的出力提升 15% ，搭配車身減輕 3kg ，原廠進行 10 度登坡實測，0~50m 加速距離比三代減少 3.7 個車身。再來是全新的加長曲軸傳動箱(同 BWS 125 )，想要加大後輪尺寸不再是困擾。
                """,
            engine: "氣冷 4V 噴射引擎 (代號 5ML)",
            brake: "前後雙碟煞",
            cardGenerationTitle: "4",
            cardSubTitle: "Dual Disc",
            imageName: "cygnus_gen4",
            yearsLabel: "2015 - 2018",
            additionalTag: "前後雙碟",
            specTitle1: "煞車",
            specValue1: "前後雙碟煞",
            specTitle2: "尾燈",
            specValue2: "水平光條式 LED 尾燈"
        ),
        CygnusModel(
            generation: "第五代",
            name: "Cygnus-X",
            years: "2018 - 2020",
            slogan: "重車級 ABS，LED 頭尾燈導入",
            themeColor: .blue,
            description: """
                頭燈從沿用四個世代的 H4 鹵素大燈改為反射式 LED，燈具模組得以小型化，加上更流暢的車體線條與尾燈具，整體視覺更純熟洗練。
                五代則是啟用來自 MT-09 的 ABS 液壓元件，125cc 速克達導入重機煞車系統。再來的新增配備是手機 12V 充電孔，讓智慧手機成為一路隨行的移動裝置。儀錶也從指針/液晶混搭變成全液晶顯示。
                眾多配備上車，五代勁戰售價逼近10萬大關( ABS 版 9.25 萬)，高價 125 速克達時代悄悄來臨。
                """,
            engine: "氣冷 4V 噴射引擎 (代號 5ML)",
            brake: "前後雙碟，配備日本 ADVICS ABS 系統",
            cardGenerationTitle: "5",
            cardSubTitle: "重車級 ABS",
            imageName: "cygnus_gen5",
            yearsLabel: "2018 - 2020",
            additionalTag: "ABS 系統導入",
            specTitle1: "頭燈",
            specValue1: "全新反射式 LED",
            specTitle2: "安全",
            specValue2: "日本 ADVICS ABS 系統"
        ),
        CygnusModel(
            generation: "第六代",
            name: "Cygnus Gryphus",
            years: "2020 - 2024",
            slogan: "新世代水冷引擎，全新車架平台",
            themeColor: .gray,
            description: """
                第六代勁戰就是再造。英文車名 Cygnus-X 天鵝座 X 轉變為 Cygnus-Gryphus 神鷹，沿用五個世代的氣冷 5ML 引擎到這裡宣告終止，全新的 Blue Core 引擎更環保、更省油、動力卻提升 30% 來到最大馬力 12.24ps 、最大扭力 1.14kgm 。怎麼辦到的?關鍵是水冷，再搭載 VVA ( Variable Valve Actuation ) 可變汽門正時還有 SMG 智能啟動。
                2023 年 3 月，俗稱 6.5 代勁戰小改款上市，這回賣點是ABS車型導入TCS循跡防滑
                系統、Y-Connect TWN App、4.3 吋全彩 TFT 智慧儀表，全車系升級 QC 3.0 USB 插座、智能起動系統(Smart-Motor-Generator)，並推出 Monster 魔爪版本。售價 9.4 萬~ 11.1 萬，顯而易見，Cygnus-Gryphus 是重機科技下放的高檔次勁戰。
                Cygnus-Gryphus 是多項新科技加持的高檔次勁戰，緊守五位數的 9.9 萬售價顯然是底線。近來三陽 Jet SL 從急起直追甚至超車，水冷 125 運動速克達市場不再是勁戰獨大。
                """,
            engine: "水冷 4V VVA 引擎 (代號 B8R)",
            brake: """
            前後雙碟，配備 UBS 連動煞車 / \nABS+TCS 雙電控系統
            """,
            cardGenerationTitle: "6",
            cardSubTitle: "水冷革新，穩重操控",
            imageName: "cygnus_gen6",
            yearsLabel: "2020 - 2024",
            additionalTag: "VVA 可變氣門揚程",
            specTitle1: "引擎",
            specValue1: "水冷 VVA 125cc",
            specTitle2: "進化科技",
            specValue2: "TFT 儀表、感應鑰匙"
        ),
        CygnusModel(
            generation: "第七代",
            name: "Cygnus X/XR",
            years: "2025 - 至今",
            slogan: "重返敏捷，雙動力編成",
            themeColor: .red,
            description: """
                七代勁戰採全新開發的 DL8 車架（根據 B8R 的市場與賽事反饋，針對車架設計進行全新研發與改進後，賦予新的平台代號），在重量不變下提升 19% 縱向剛性（與六代相比），原廠也調整拉桿槓桿比，提供更好的煞車手感，並加大前碟盤至 267mm，同時卡鉗活塞也加大，提供更好的制動。
                引擎維持水冷 Blue Core 引擎（同期之同引擎 125cc 車款為六代勁戰、BWS 125；150cc 車款為 Force2.0、AUGUR、NMAX 155 ），並搭載 VVA 可變汽門技術。根據報導，七代勁戰 125cc 版本在傳動和引擎調校上進行了改良，例如調整了變速特性，讓車輛在全開油門時能更早進入傳動和引擎效率最佳的狀態，使得騎乘感受比六代更為輕盈、加速更敏捷。
                """,
            engine: "優化水冷 VVA 引擎 (代號 B8R)",
            brake: """
            前後雙碟，標配 TCS 循跡防滑＋\nUBS 連動煞車 / ABS 防鎖死煞車
            """,
            cardGenerationTitle: "7",
            cardSubTitle: "全新雙動力",
            imageName: "cygnus_gen7",
            yearsLabel: "2025 - Present",
            additionalTag: "125cc/155cc 雙動力 ",
            specTitle1: "電控系統",
            specValue1: "標配 TCS",
            specTitle2: "進化車架",
            specValue2: "DL8 車架平台"
        )
    ]
    
    var body: some View {
        TabView {
            // Tab 1: 圖鑑 (卡片滑動)
            HistoryView(scooters: scooters)
                .tabItem {
                    Label("歷史", systemImage: "book.fill")
                }
            
            // Tab 2: 規格 (清單比較)
            ComparisonView(scooters: scooters)
                .tabItem {
                    Label("總覽與規格", systemImage: "list.bullet.rectangle.portrait")
                }
            
            // Tab 3: 品牌 (關於)
            AboutView()
                .tabItem {
                    Label("關於", systemImage: "info.circle.fill")
                }
        }
    }
}


#Preview {
    MainTabView()
}
