//
//  CircularProgressView.swift
//  FilmSearch
//
//  Created by Mehmet Macbook Pro on 24.12.2023.
//

import SwiftUI

struct CircularProgressView: View {
    private let scaleEffectValue : Double = 1.5
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(scaleEffectValue)
    }
}

