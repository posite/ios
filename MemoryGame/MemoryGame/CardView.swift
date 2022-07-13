//
//  CardView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

struct CardView: View {
    enum CardState{
        case removed, closed, open
    }
    var state: CardState
    var prefix : String
    var num : Int
    var body: some View {
        if state == .removed{
            Image(systemName: "clear")
                .resizable()
                .frame(width: 90, height: 90)
                .foregroundColor(.gray)
        }else{
            Image(imageName)
        }
        
    }
    var imageName: String{
        if state == .closed{
            return prefix+"_back"
        }
        return prefix+String(format:"_%02d_01",num)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(state: .open,  prefix: "f", num: 1)
            CardView(state: .closed, prefix: "f", num: 2)
            CardView(state: .removed, prefix: "t", num: 2)
        }
    }
}
