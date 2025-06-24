//
//  ContentView.swift
//  TPLProjectName
//
//  Created by TPLAuthor on 20/4/25.
//

import SwiftUI
import TPLProjectNameCore

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        LoginView()
            .environmentObject(appState.authInteractor)
        
        .onAppear {
            // Perform any setup required when the view appears
            appState.startup()
        }
        .onDisappear {
            // Perform any cleanup if necessary
            appState.shutdown()
        }
    }
      
}

#Preview {
    ContentView()
}
