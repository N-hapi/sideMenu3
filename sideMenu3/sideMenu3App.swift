//
//  sideMenu3App.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 16.11.22.
//

import SwiftUI

@main
struct sideMenu3App: App {
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter)
        }
    }
}
