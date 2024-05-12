//
//  TodoListItemView.swift
//  TodoList
//
//  Created by Ricky Villareal on 5/6/24.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    
    let item: TodoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    TodoListItemView(item: TodoListItem(id: "123",
                                        title: "Get milk",
                                        dueDate: Date().timeIntervalSince1970,
                                        createDate: Date().timeIntervalSince1970,
                                        isDone: false))
}
