//
//  ContentView.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 16.11.22.
//

import SwiftUI

struct MotherView: View {
    @State var currentPage: Page = .page1
    @State var showMenu = false
    var body: some View {

        let drag = DragGesture().onEnded {
            if $0.translation.width < -100 {
                withAnimation {
                    self.showMenu = false
                }
            }
        }
        ZStack(alignment: .leading) {
            return NavigationView {
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
                }.navigationBarTitle("Side Menu", displayMode: .inline)
                    .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                    ))
            }
        }
            .gesture(drag)
    }
    // .padding()
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        MotherView()

    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    @State var currentPage: Page = .page1
    var body: some View {
       
            switch currentPage {
            case .page1:
                ContentViewA()
            case .page2:
                ContentViewB()
            }
        withAnimation {
            Button(action: {
                //self.showMenu = true
                currentPage = .page2
                print("Open the side menu")
            }) {
                Text("Show Menu")
            }
        }
    }
}
