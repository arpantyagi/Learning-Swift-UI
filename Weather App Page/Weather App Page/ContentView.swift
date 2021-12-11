//
//  ContentView.swift
//  Weather App Page
//
//  Created by Arpan Tyagi on 10.12.2021.
//

import SwiftUI

struct ContentView: View {
        
    @State private var DarkMode = true
    
    var body: some View {
        
        ZStack{
            BackgroundView(DarkMode: $DarkMode)
            VStack{
                cityView(cityName: "Prague, CZ")
            
                todayView(imageName: DarkMode ? "moon.stars.fill" : "sun.max.fill",
                          temperature: -2)
                
                Spacer()
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.fill",
                                   temperature: "2")
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "sun.max.fill",
                                   temperature: "7")
                    WeatherDayView(dayOfWeek: "SUN",
                                   imageName: "cloud.snow.fill",
                                   temperature: "3")
                    WeatherDayView(dayOfWeek: "MON",
                                   imageName: "sunset.fill",
                                   temperature: "3")
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "snowflake",
                                   temperature: "0")
                }
                
                Spacer()
    
                Button{
                    DarkMode.toggle()
                } label: {
                    WeatherButton(title: DarkMode ? "Dark Side" : "Light Side",
                                  textColor: Color.blue,
                                  backgroundColor: Color.white)
                }
                Spacer()
            }
        }
                
    }
            
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro")
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: String
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium))
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            
            Text(temperature)
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {

    @Binding var DarkMode: Bool

    var body: some View {
        LinearGradient( gradient: Gradient(colors: [DarkMode ? Color("darkblue") : Color.blue, DarkMode ? Color.black : Color.teal]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct cityView: View {
    var cityName: String
    
    var body: some View {
        VStack{
            Text(cityName)
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(Color.white)
                .padding(.top)
        }
    }
}

struct todayView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)º")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

