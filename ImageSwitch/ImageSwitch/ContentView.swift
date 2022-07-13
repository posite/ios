//
//  ContentView.swift
//  ImageSwitch
//
//  Created by 홍길동 on 2022/07/11.
//

import SwiftUI

//struct TopButtonMod: ViewModifier{
//    func body(content: Content) -> some View {
//        content
//            .frame(width: 40,height:40)
//    }
//}
struct TopButton: View {
    enum Dir{case left, right}
    var dir:Dir
    var enabled: Bool
//    var ImageName: String
    var action: ()->Void
    var body: some View {
        var imageName = dir == .left ? "prev":"next"
        if !enabled{
            imageName += "_d"
        }
        return Button{
            action()
        } label: {
            Image(imageName)
                .resizable()
                .frame(width: 40,height:40)
                .foregroundColor(
                    enabled ? Color.blue:Color.gray
                )
        }
    }
}


struct ContentView: View {
    @State var pageNumber=1
    var body: some View {
        VStack {
            HStack {
                TopButton(dir:.left,enabled:pageNumber>1){
                    pageNumber-=1
                }
                .disabled(pageNumber==1)
                Spacer()
                Text("\(pageNumber)/5")
                    .font(.largeTitle)
                Spacer()
                TopButton(dir:.right,enabled:pageNumber<5) {
                    pageNumber+=1
                }
                .disabled(pageNumber==5)
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

