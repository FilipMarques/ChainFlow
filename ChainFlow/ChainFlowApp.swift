//
//  ChainFlowApp.swift
//  ChainFlow
//
//  Created by Filipe Camargo Marques on 29/07/25.
//

import SwiftUI

@main
struct ChainFlowApp: App {

    @StateObject private var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(false)
            }
            .environmentObject(vm)
        }
    }
}
