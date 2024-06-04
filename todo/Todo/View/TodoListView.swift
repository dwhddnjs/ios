//
//  TodoListView.swift
//  todo
//
//  Created by 이종원 on 6/5/24.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
//    @State var todoItem: [TodoModel] = []
//    @State var isPresented:Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    List {
                        Section("할일 목록"){
                            ForEach(viewModel.todoItem) { item in
                                if !item.isComplete {
                                    HStack {
                                        Text(item.title)
                                        Spacer()
                                        Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(item.isComplete ? .green: .gray)
                                            .onTapGesture {
                                                viewModel.toggleItem(item: item)
                                        }
                                    }
                                }
                            }.onDelete(perform: viewModel.removeItem).onMove(perform: viewModel.moveItem)
                        }
                        Section("완료 목록"){
                            ForEach(viewModel.todoItem) { item in
                                if item.isComplete {
                                    HStack {
                                        Text(item.title)
                                            .foregroundColor(Color(.systemGray3))
                                            .strikethrough()
                                        Spacer()
                                        Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(item.isComplete ? .green: .gray)
                                            .onTapGesture {
                                                viewModel.toggleItem(item: item)
                                        }
                                    }
                                }
                            }.onDelete(perform: viewModel.removeItem).onMove(perform: viewModel.moveItem)
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                    Button("생성하기"){
                        viewModel.isPresented.toggle()
                    }
                    .frame(width: 200, height: 30)
                    .padding()
                    .foregroundColor(Color(.white))
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .sheet(isPresented: $viewModel.isPresented) {
                        NewTodoListView(viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Todo List")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

#Preview {
    TodoListView()
}
