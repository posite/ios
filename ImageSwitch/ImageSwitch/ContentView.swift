//
//  ContentView.swift
//  ImageSwitch
//
//  Created by 홍길동 on 2022/07/11.
//

import SwiftUI

struct ContentView: View {
    @State var pageNumber=1
    var body: some View {
        VStack {
            HStack {
                Button {
                    if pageNumber>1{
                        pageNumber-=1
                    }
                } label: {
                    Image("prev")
                        .resizable()
                        .frame(width: 40,height:40)
                }
                Spacer()
                Text("\(pageNumber)/5")
                    .font(.largeTitle)
                Spacer()
                Button {
                    if pageNumber<5{
                        pageNumber+=1
                    }
                } label: {
                    Image("next")
                        .resizable()
                        .frame(width: 40, height:40)
                }
            }
            Image("dog1")
                .resizable()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
