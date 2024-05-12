//
//  TodoListItemsView.swift
//  TodoList
//
//  Created by Ricky Villareal on 5/6/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
        
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "user/\(userId)/todos")
        
        self._viewModel = StateObject(
            wrappedValue: TodoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button ("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    TodoListView(userId: "2A5J5veFvNhJV86MMvUly3XuRmI2")
}
