//
//  CircularProgressView.swift
//  FilmSearch
//
//  Created by Mehmet Macbook Pro on 24.12.2023.
//

import SwiftUI

struct CircularProgressView: View {
    
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(AppConstants.shared.scaleEffectValue)
    }
}

