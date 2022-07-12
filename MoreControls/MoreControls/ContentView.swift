//
//  ContentView.swift
//  MoreControls
//
//  Created by 홍길동 on 2022/07/12.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State var userName = ""
    @State var angle = 0.0
    var body: some View {
        VStack {
            Text("Name : \(userName)  Count : \(count)")
                .font(.title)
                .fontWeight(.heavy)
                .padding()
                .rotationEffect(.degrees(angle))
                .animation(.easeIn(duration: 0.5), value:angle)
            Text("Angle : \(angle)")
            Image(systemName: "pencil.circle")
                .font(.largeTitle)
            Button {
                count+=1
            } label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
            }
            TextField("Enter your name", text: $userName)
                .frame(width:200)
            Slider(value: $angle,in:0...360)
                .frame(width:200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
