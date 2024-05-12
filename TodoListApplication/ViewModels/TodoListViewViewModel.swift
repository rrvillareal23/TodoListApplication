//
//  TodoListViewViewModel.swift
//  TodoList
//
//  Created by Ricky Villareal on 5/6/24.
//

import FirebaseFirestore
import Foundation

// Primary tab
// viewmodel for list of items view
class TodoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    private var userId: String
    
    init (userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: Item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("user")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
