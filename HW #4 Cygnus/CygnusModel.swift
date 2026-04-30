//
//  Cygnus.swift
//  HW #4 Cygnus
//
//  Created by 114-2Workshop12 on 2026/4/23.
//

import Foundation
import SwiftUI

struct CygnusModel: Identifiable {
    let id = UUID()
    let generation: String
    let name: String
    let years: String
    let slogan: String
    let themeColor: Color
    let description: String
    let engine: String
    let brake: String
    let size: String
    
    let cardGenerationTitle: String
    let cardSubTitle: String
    
    let imageName: String
    
    let yearsLabel: String
    let additionalTag: String?
    let specTitle1: String
    let specValue1: String
    let specTitle2: String
    let specValue2: String
}
