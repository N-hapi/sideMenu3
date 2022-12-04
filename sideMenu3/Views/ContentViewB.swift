//
//  ContentViewB.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 20.11.22.
//

import SwiftUI

struct ContentViewB: View {
    var body: some View {
        VStack{
            HStack {
                Text("jessss").padding()
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Profile")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }
            Spacer()
            
        }
        Spacer()
    }
}

struct ContentViewB_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewB()
    }
}
