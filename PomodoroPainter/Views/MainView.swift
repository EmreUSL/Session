//
//  MainView.swift
//  PomodoroPainter
//
//  Created by emre usul on 14.03.2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: PomodoroModel
    
    var body: some View {
  
        VStack {
            ZStack {
              
                TabView {
                    TimeView()
                        .tabItem {
                            Label(LocalizedStringKey("sessions"),
                                  systemImage: "timer")
                       
                        }
                    
                    StatisticView()
                        .tabItem {
                            Label(LocalizedStringKey("statistic"),
                                  systemImage: "pencil")
                        }
                }
                .tint(.black)
                Spacer()
            }
        }
        .onReceive(TimeManager.shared.time) { _ in
            viewModel.updateCountdown()
            viewModel.newDay()
            viewModel.checkNewWeek()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(PomodoroModel())
    }
}
