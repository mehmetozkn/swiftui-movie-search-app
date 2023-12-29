//
//  AppConstants.swift
//  FilmSearch
//
//  Created by Mehmet Macbook Pro on 29.12.2023.
//

import SwiftUI

final class AppConstants {
    static let shared = AppConstants()
    private init () {}
    
    let scaleEffectValue : Double = 1.5
    
    let movieImageWidthSize = UIScreen.main.bounds.width * 0.2
    let movieImageHeightSize = UIScreen.main.bounds.height * 0.13
    let textFieldText = "Search movies"
    
    let movieDetailImageWidthSize =  UIScreen.main.bounds.width * 0.6
    let movieDetailImageHeightSize =  UIScreen.main.bounds.height * 0.3
}
