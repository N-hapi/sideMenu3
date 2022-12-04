//
//  ContentView.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 16.11.22.
//

import SwiftUI

struct MotherView: View {
    //@State var currentPage: Page = .page1
    @State var showMenu = false
    @StateObject var viewRouter: ViewRouter
    var body: some View {

        let drag = DragGesture().onEnded {
            if $0.translation.width < -100 {
                withAnimation {
                    self.showMenu = false
                }
            }
        }
        ZStack(alignment: .leading) {
            NavigationView {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        MainView(showMenu: self.$showMenu, viewRouter: viewRouter)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(x: self.showMenu ? geometry.size.width / 2 : 0)
                            .disabled(self.showMenu ? true : false)
                        if self.showMenu {
                            MenuView(showMenu: self.$showMenu, viewRouter: viewRouter)
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


struct MotherView_Previews: PreviewProvider {
    //@StateObject var viewRouter: ViewRouter
    static var previews: some View {

        MotherView(viewRouter: ViewRouter())

    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    //@State var currentPage: Page = .page1
    @StateObject var viewRouter: ViewRouter
    var body: some View {

        switch viewRouter.currentPage {
        case .page1:
            ContentView()
            ContentViewA()
            Spacer()
        //ContentView()
            
        case .page2:
            ContentViewB()
        }
//        withAnimation {
//            Button(action: {
//                //self.showMenu = true
//                viewRouter.currentPage = .page2
//                print("Open the side menu")
//            }) {
//                Text("Show Menu")
//            }
        // }
    }
}
