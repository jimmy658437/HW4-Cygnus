//
//  AboutView.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    Image(systemName: "shield.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                        .padding(.top, 50)
                    
                    Text("Yamaha Cygnus 精神")
                        .font(.title).bold()
                    
                    Text("勁戰 (Cygnus) 系列自 2002 年發表以來，一直被譽為「彎道王者」。憑藉著強韌的車架、優異的配重與無限的改裝潛力，它不只是代步工具，更是台灣二輪文化的縮影。")
                        .padding(.horizontal)
                        .lineSpacing(8)
                    
                    Divider().padding()
                    
                    Text("")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("品牌故事")
        }
    }
}

#Preview {
    AboutView()
}
