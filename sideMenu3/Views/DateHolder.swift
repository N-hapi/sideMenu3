//
//  DateHolder.swift
//  sideMenu3
//
//  Created by Nael Alshowaikh on 04.12.22.
//

import SwiftUI
import CoreData

class  DateHolder: ObservableObject{
    
    init(_ context: NSManagedObjectContext){
        
    }
    
    func saveContext(_ context: NSManagedObjectContext) {
       do {
           try context.save()
       } catch {
           // Replace this implementation with code to handle the error appropriately.
           // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
           let nsError = error as NSError
           fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
       }
   }
    
    
}