//
//  MainButton.swift
//  PomodoroPainter
//
//  Created by emre usul on 15.03.2023.
//

import SwiftUI

struct MainButton: View {
    @EnvironmentObject var viewModel: PomodoroModel
    
    var body: some View {
        
        VStack {
            
            Button {
                if viewModel.isActive == false {
                    viewModel.start()
                } else {
                    viewModel.pause()
                    alertView()
                }
            } label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "\(viewModel.isActive ? "pause.fill" : "play.fill")")
                            .foregroundColor(viewModel.isActive ? .red : .green)
                            .font(.largeTitle)
                    )
            }
        }
    }
    
    func alertView() {
        let quit = String.LocalizationValue(stringLiteral: "quit")
        let resumed = String.LocalizationValue(stringLiteral: "resume")
        let yes = String.LocalizationValue(stringLiteral: "yes")
        let session = String.LocalizationValue(stringLiteral: "quitSession")
        
        let alert = UIAlertController(title: String (localized: session), message:String(localized: quit), preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: String (localized: yes), style: .destructive) { _ in
            viewModel.restart()
        }
        
        let resume = UIAlertAction(title: String (localized: resumed), style: .default) { _ in
            viewModel.start()
        }
        
        alert.addAction(resume)
        alert.addAction(cancel)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
        
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton()
            .environmentObject(PomodoroModel())
    }
}
