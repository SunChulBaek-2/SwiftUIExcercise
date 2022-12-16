//
//  GetContentUseCase.swift
//  SwiftUIExcercise
//
//  Created by 백선철 on 2022/12/16.
//

import Foundation

class GetContentParam {}

class GetContentResult {
    init(name: String, bday: Date) {
        self.name = name
        self.bday = bday
    }
    var name: String
    var bday: Date
}

class GetContentUseCase : UseCase {
    init() {
        print("GetContentUseCase.init()")
    }
    
    func execute(param: GetContentParam) async -> GetContentResult {
        print("GetContentUseCase.execute()")
        let _ = await Repository().getData()
        return GetContentResult(name: "iOS", bday: Date.now)
    }
}
