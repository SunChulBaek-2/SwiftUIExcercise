//
//  ContentView.swift
//  SwiftUIExcercise
//
//  Created by 백선철 on 2022/12/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, \(viewModel.state.name)")
            Button("이름변경") {
                viewModel.toggleName()
            }
        }
        .padding()
        .onAppear {
            Task {
                await viewModel.getContent()
            }
        }
        .onDisappear {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
