//
//  TodoListApplicationApp.swift
//  TodoListApplication
//
//  Created by Ricky Villareal on 5/12/24.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
