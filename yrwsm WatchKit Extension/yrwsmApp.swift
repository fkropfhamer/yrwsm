//
//  yrwsmApp.swift
//  yrwsm WatchKit Extension
//
//  Created by Fabian Kropfhamer on 19.01.22.
//

import SwiftUI

@main
struct yrwsmApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
