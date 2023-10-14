//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Alejandro Sierro Galán on 13/10/23.
//

import SwiftUI

struct ContentView: View {
   @State
    private var isNight: Bool = false
    
    let view = UIView()
    
    var body: some View {
        ZStack {
            backgroundColor(isNight: $isNight)
            VStack {
                Text("Cupertino, CA")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76º")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 50)
                weatherWeekCarousel()
                Spacer()
                Button {
                    isNight = !isNight
                } label: {
                    Text("Change day time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.title3)
                        .fontWeight(.medium)
                        .cornerRadius(12)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct weatherWeekCarousel: View {
    var body: some View {
        HStack(spacing: 23) {
            SubWeatherView(dayOfWeek: "TUE",
                           dayTemp: 80,
                           weatherICon: "sun.dust.fill")
            SubWeatherView(dayOfWeek: "WED",
                           dayTemp: 70,
                           weatherICon: "cloud.drizzle.fill")
            SubWeatherView(dayOfWeek: "THU",
                           dayTemp: 68,
                           weatherICon: "wind")
            SubWeatherView(dayOfWeek: "FRI",
                           dayTemp: 81,
                           weatherICon: "cloud.sun.bolt.fill")
            SubWeatherView(dayOfWeek: "SAT",
                           dayTemp: 78,
                           weatherICon: "sun.rain.fill")
        }
    }
}

struct backgroundColor: View {
    
    @Binding
    public var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: isNight ? 
                       [.black, Color("bottomBackgroundNight")]: [Color("topBackground"), Color("bottomBackground")],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}
