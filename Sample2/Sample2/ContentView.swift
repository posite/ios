//
//  ContentView.swift
//  Sample2
//
//  Created by 홍길동 on 2022/07/11.
//

import SwiftUI

struct BorderedShadow : ViewModifier{
    func body(content:Content)->some View{
        content
            .padding()
            .border(Color.green,width: 3)
            .shadow(color: Color.gray, radius: 5, x: 2, y: 5)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Button {
                print("Hi")
            } label: {
                Image(systemName: "link")
                    .resizable()
                    .frame(width: 50, height: 40)
            }
            Spacer()
            ExtractedView()
            Image(systemName: "folder.badge.plus")
            Image("dog2")
                .modifier(BorderedShadow())
            Image("dog3")
            Text("Hello, new world!")
                .padding()
                .background(Color.gray)
                .font(.headline)
        }
        .padding()
        .background(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    var body: some View {
        HStack {
            Text("Hello, new world!")
                .background(Color.green)
                .padding(5)
            Image("dog1")
            Image(systemName: "pencil")
                .resizable()
                .frame(width: 30, height: 40)
                .foregroundColor(Color.blue)
                .border(Color.red,width: 8)
                .shadow(color: Color.gray, radius: 6, x: 0, y: 6)
        }
    }
}
