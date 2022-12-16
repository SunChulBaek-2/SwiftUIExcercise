//
//  ContentViewModel.swift
//  SwiftUIExcercise
//
//  Created by 백선철 on 2022/12/16.
//

import Foundation

class ContentState {
    init(name: String, bday: Date) {
        self.name = name
        self.bday = bday
    }
    
    var name: String
    var bday: Date
}

final class ContentViewModel: ObservableObject {
    init() {
        print("ContnetViewModel.init()")
        getContentUseCase = GetContentUseCase()
    }
    
    var getContentUseCase: GetContentUseCase
    
    @Published var state = ContentState(name: "xxx", bday: Date())
    
    @MainActor
    func getContent() async {
        print("ContnetViewModel.getContent()")
        let result = await getContentUseCase.execute(param: GetContentParam())
        state = ContentState(name: result.name, bday: result.bday)
    }
    
    func toggleName() {
        print("ContnetViewModel.toggleName()")
        if (state.name == "iOS") {
            state = ContentState(name: "Android", bday: Date.now)
        } else {
            state = ContentState(name: "iOS", bday: Date.now)
        }
    }
}
