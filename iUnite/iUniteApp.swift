//
//  iUniteApp.swift
//  iUnite
//
//  Created by Spencer Rafada on 10/31/22.
//

import SwiftUI

@main
struct iUniteApp: App {
    @State private var vm = EventsViewModel()
    var body: some Scene {
        WindowGroup {
            EventsView()
                .environmentObject(vm)
        }
    }
}
