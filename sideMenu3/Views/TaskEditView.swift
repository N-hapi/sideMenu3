//
//  TaskEditView.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 04.12.22.
//

import SwiftUI

struct TaskEditView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var dateHolder: DateHolder
    @State var selectedTaskItem: TaskItem?
    @State var name: String
    @State var desc: String
    @State var dueDate: Date
    @State var scheduleTime: Bool

    init(passedTaskItem: TaskItem?, initialDate: Date) {
        //edit mode
        if let taskItem = passedTaskItem {
            _selectedTaskItem = State(initialValue: taskItem)
            _name = State(initialValue: taskItem.name ?? "")
            _desc = State(initialValue: taskItem.desc ?? "")
            _dueDate = State(initialValue: taskItem.dueDate ?? initialDate)
            _scheduleTime = State(initialValue: taskItem.scheduleTime)
            _desc = State(initialValue: taskItem.desc ?? "")
        }
        //new mode
            else {
            _name = State(initialValue: "")
            _desc = State(initialValue: "")
            _dueDate = State(initialValue: initialDate)
            _scheduleTime = State(initialValue: false)
        }

    }

    var body: some View {

        Form {
            Section(header: Text("Task"))
            {
                TextField("Task Name", text: $name)
                TextField("Desc", text: $desc)
            }
            Section(header: Text("Due Date"))
            {
                Toggle("Schdule time", isOn: $scheduleTime)
                DatePicker("Due Date ", selection: $dueDate, displayedComponents: displayComps())
            }
            Section()
            {
                Button("Save", action: saveAction)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
            }




        }






    }
    func saveAction()
    {
        withAnimation{
            if selectedTaskItem == nil{
                selectedTaskItem = TaskItem(context: viewContext)
            }
            selectedTaskItem?.created = Date()
            selectedTaskItem?.name = name
            selectedTaskItem?.dueDate = dueDate
            selectedTaskItem?.scheduleTime = scheduleTime
            
            dateHolder.saveContext(viewContext)
            self.presentationMode.wrappedValue.dismiss()
        }

    }
    func displayComps() -> DatePickerComponents{
        return scheduleTime ? [.hourAndMinute, .date] : [.date]
    }
}

struct TaskEditView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEditView(passedTaskItem: TaskItem(), initialDate: Date())
    }
}
