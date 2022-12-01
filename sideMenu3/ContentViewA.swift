//
//  ContentViewA.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 20.11.22.
//

import SwiftUI

struct ContentViewA: View {
    var body: some View {
        //Spacer()
        VStack{
            HStack {
                Text("helllllllo").padding()
              
                    .padding()
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                    Text("Messages")
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }
            Spacer()
            
        }
        Spacer()
    }
}

struct ContentViewA_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewA()
    }
}
