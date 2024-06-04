//
//  NewTodoListView.swift
//  todo
//
//  Created by 이종원 on 6/5/24.
//

import SwiftUI

struct NewTodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
    @State private var newTodoListTitle: String = ""
//    @Binding var todoItem: [TodoModel]
//    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("새로운 할일을 추가해보세요")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading) {
                Text("새로운 할일")
                    .font(.subheadline)
                    .foregroundColor(Color(.systemGray2))
                TextField("", text: $newTodoListTitle)
                    .frame(width: 300, height: 20)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
            }
            .padding([.top], 30)
                Button("완료"){
                    viewModel.addItem(title: newTodoListTitle)
                    newTodoListTitle = ""
                    viewModel.isPresented = false
                }
                .frame(width: 200, height: 30)
                .padding()
                .foregroundColor(Color(.white))
                .background(Color(.systemBlue))
                .cornerRadius(10)
                Spacer()
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding([.top], 50)
        .background(Color(.systemGray6))
    }
}

//#Preview {
//    @Binding var todoItem: [TodoModel]
//    NewTodoListView()
//}
