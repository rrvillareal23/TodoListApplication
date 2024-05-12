//
//  TodoListItemViewViewModel.swift
//  TodoList
//
//  Created by Ricky Villareal on 5/6/24.
//

import Firebase
import FirebaseFirestore
import Foundation

// single to do list item view
// each row in items list
class TodoListItemViewViewModel: ObservableObject {
    init () {}
    
    func toggleIsDone(item: TodoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("user")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
