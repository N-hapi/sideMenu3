//
//  FloatingButton.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 04.12.22.
//

import SwiftUI

struct FloatingButton: View {
    @EnvironmentObject var dateHolder: DateHolder
    var body: some View {
        Spacer()
        HStack{
            NavigationLink(destination: TaskEditView(passedTaskItem: nil, initialDate: Date()).environmentObject(dateHolder))
            {
                Text("New Task")
                    .font(.headline)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(30)
            .padding(30)
            .shadow(color: .black.opacity(0.3), radius: 3, x: 3, y:3 )
            
            
            
        }
    }
    
    struct FloatingButton_Previews: PreviewProvider {
        static var previews: some View {
            FloatingButton()
        }
    }
}
