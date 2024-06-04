//
//  TodoModel.swift
//  todo
//
//  Created by 이종원 on 6/5/24.
//

import Foundation

struct TodoModel: Identifiable {
    let id = UUID()
    var title: String
    var isComplete: Bool = false
}

extension TodoModel {
    static var MOCK_DATA: [TodoModel] {
        get {
            return [
                TodoModel(title: "ios App dev"),
                TodoModel(title: "달리기 100바퀴"),
                TodoModel(title: "개발 서적 완독"),
                TodoModel(title: "저녁 식사 요리하기"),
                TodoModel(title: "맥북 파일 정리하기")
            ]
        }
    }
}


