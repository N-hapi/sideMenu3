//
//  TaskCell.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 04.12.22.
//

import SwiftUI

struct TaskCell: View {
    @EnvironmentObject var dateHolder: DateHolder
    @ObservedObject var passedTaskItem: TaskItem
    var body: some View {
        Text(passedTaskItem.name ?? "")
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(passedTaskItem: TaskItem())
    }
}
