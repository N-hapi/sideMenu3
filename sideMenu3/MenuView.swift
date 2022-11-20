//
//  MenuView.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 16.11.22.
//

import SwiftUI

struct MenuView: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
                .padding(.top, 100)
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Messages")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
                .padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
                .padding(.top, 30)
            Spacer()
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 32 / 255, green: 32 / 255, blue: 32 / 255))
            .edgesIgnoringSafeArea(.all)
        
       
        
           
                switch viewRouter.currentPage {
                case .page1:
                    ContentViewA()
                case .page2:
                    ContentViewB()
                }
            withAnimation {
                Button(action: {
                    //self.showMenu = true
                    viewRouter.currentPage = .page2
                    print("Open the side menu")
                }) {
                    Text("Show Menu")
                }
            }
        
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewRouter: ViewRouter())
    }
}
