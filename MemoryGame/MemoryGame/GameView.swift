//
//  ContentView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        GridStack(rows: 6, columns: 3) { row, column in
            CardView(state: .open, prefix: "f", num: row+column+1)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
