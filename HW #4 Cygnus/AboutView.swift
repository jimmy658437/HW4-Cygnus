//
//  AboutView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI
import WebKit

// MARK: - 1. 關於品牌視圖
struct AboutView: View {
    @State private var isShowingWebView = false

    // 延續 App 視覺風格的漸層色
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
                bgGradient.ignoresSafeArea()

                VStack(spacing: 0) {
                    // 頂部大標題區塊
                    VStack(alignment: .leading, spacing: 10) {
                        Text("關於")
                            .font(.system(size: 38, weight: .black))
                        Text("Revs your Heart.")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)

                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 20) {

                            // Yamaha 品牌故事卡片
                            AboutCardView(
                                iconName: "tuningfork",
                                fallbackIcon: "globe.asia.australia.fill",
                                title: "品牌理念",
                                subtitle: "創造感動",
                                content:
                                    """
Yamaha 致力於為人們帶來「感動」。透過\n不斷創新的技術與對卓越品質的堅持，期望創造出超越期待的價值，讓每一次的騎乘都充滿喜悅與激情，豐富您的移動生活。
"""
                            )

                            // Cygnus 卡片
                            AboutCardView(
                                iconName: "flag.checkered",
                                fallbackIcon: "flag.checkered",
                                title: "關於 Cygnus",
                                subtitle: "發揚台灣運動型速克達",
                                content:
                                    "勁戰 (Cygnus) 系列自 2002 年發表以來，一直被譽為「彎道王者」。憑藉著強韌的車架、優異的配重與無限的改裝潛力，它不只是代步工具，更是台灣二輪運動文化的縮影。"
                            )

                            // 前往官方網站
                            Button(action: {
                                isShowingWebView = true
                            }) {
                                HStack {
                                    Text("探索最新 CYGNUS 車系")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                    Spacer()
                                    Image(systemName: "network")
                                        .font(.title3)
                                }
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(
                                            Color(red: 0, green: 0.2, blue: 0.7)
                                                .opacity(0.6)
                                        )
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(
                                            Color.white.opacity(0.3),
                                            lineWidth: 1
                                        )
                                )
                                .shadow(
                                    color: .black.opacity(0.3),
                                    radius: 5,
                                    x: 0,
                                    y: 3
                                )
                            }
                            .padding(.top, 10)
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
            // WKWebView 視窗
            .sheet(isPresented: $isShowingWebView) {
                if let url = URL(
                    string:
                        "https://www.yamaha-motor.com.tw/motor/motor_CYGNUS_XR"
                ) {
                    NavigationStack {
                        WebView(url: url)
                            .ignoresSafeArea(edges: .bottom)
                            .navigationTitle("YAMAHA 官方網站")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button("關閉") {
                                        isShowingWebView = false
                                    }
                                }
                            }
                    }
                }
            }
        }
    }
}

// MARK: - 2. 關於頁面的微光毛玻璃卡片模組
struct AboutCardView: View {
    let iconName: String
    let fallbackIcon: String
    let title: String
    let subtitle: String
    let content: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: fallbackIcon)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.white.opacity(0.15))
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                }
            }

            Divider()
                .background(Color.white.opacity(0.2))

            Text(content)
                .font(.body)
                .lineSpacing(6)
                .foregroundColor(.white.opacity(0.85))
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(20)
        .background(
            ZStack {
                Rectangle().fill(.ultraThinMaterial)
                Color.black.opacity(0.2)
            }
        )
        .environment(\.colorScheme, .dark)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
    }
}

// MARK: - 3. 使用 UIViewRepresentable 包裝 WKWebView
struct WebView: UIViewRepresentable {
    let url: URL

    // 建立 WKWebView 實體
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    // 更新視圖，載入我們傳入的 URL
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

// MARK: - 預覽
#Preview {
    AboutView()
}
