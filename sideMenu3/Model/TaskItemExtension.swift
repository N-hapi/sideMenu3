//
//  TaskItemExtension.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 04.12.22.
//

import SwiftUI


extension TaskItem {
    func isCompleted() -> Bool {
        return completedDate != nil
        
    }
}
