//
//  SubWeatherView.swift
//  SwiftUI-Weather
//
//  Created by Alejandro Sierro Galán on 14/10/23.
//

import SwiftUI

struct SubWeatherView: View {
    let dayOfWeek: String
    let dayTemp: Int
    let weatherICon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfWeek)
                .foregroundStyle(.white)
                .font(.title2)
                .fontWeight(.medium)
            Image(systemName: weatherICon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            Text("\(dayTemp)º")
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    SubWeatherView(dayOfWeek: "TUE", dayTemp: 80, weatherICon: "cloud.sun.fill")
}
