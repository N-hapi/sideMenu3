//
//  ContentView.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 16.11.22.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    var body: some View {
        VStack {
            let drag = DragGesture()
             GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width / 2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width / 2)
                            .transition(.move(edge: .leading))
                    }
                }
            }
        }
           // .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    var body: some View {
        withAnimation {
            Button(action: {
                self.showMenu = true
                print("Open the side menu")
            }) {
                Text("Show Menu")
            }
        }
    }
}
