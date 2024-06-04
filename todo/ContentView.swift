//
//  ContentView.swift
//  todo
//
//  Created by 이종원 on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: todoDocument

    var body: some View {
        TextEditor(text: $document.text)
        Label(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView(document: .constant(todoDocument()))
}
