//
//  CardView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

struct CardView: View {
    var card : Card
    var prefix : String
    var timer = Timer.publish(every: 0.1 ,on: .main,in: .common).autoconnect()
    @State var frameIndex = 1
    var body: some View {
        if card.state == .removed{
            Image(systemName: "clear")
                .resizable()
                .frame(width: 90, height: 90)
                .opacity(0.4)
        }else{
            Image(imageName)
                .onReceive(timer) { _ in
//                    NSLog("on timer receive")
                    frameIndex += 1
                    if frameIndex > 8 {
                        frameIndex = 1
                    }
                    
                }
        }
        
    }
    var imageName: String{
        if card.state == .closed{
            return prefix+"_back"
        }
        return prefix+String(format:"_%02d_%02d",card.number,frameIndex)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(card: Card(state: .open, number: 1),  prefix: "f")
            CardView(card: Card(state: .closed, number: 2), prefix: "f")
            CardView(card: Card(state: .removed, number: 2), prefix: "t")
        }
    }
}
