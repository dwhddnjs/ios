//
//  todoApp.swift
//  todo
//
//  Created by 이종원 on 6/4/24.
//

import SwiftUI

@main
struct todoApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: todoDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
