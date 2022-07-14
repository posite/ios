//
//  ContentView.swift
//  MemoryGame
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

struct GameView: View {
    var prefix: String
    @ObservedObject var game = GameModel()
    @Environment(\.presentationMode) var present
    @State var showsRestartAlert = false
    var body: some View {
        VStack {
            HStack{
                Text("MemoryGame")
                Spacer()
                Text("Flips: \(game.flips)")
            }
            .padding(.horizontal)
            GridStack(rows: GameModel.rows, columns: GameModel.cols) { row, column in
                CardView(card: game.card(row: row, col: column), prefix: prefix)
                    .gesture(TapGesture().onEnded{
                        game.open(row:row, col: column)
                        if game.over {
                            showsRestartAlert = true
                        }
                    }
                )
            }.aspectRatio(CGSize(width: GameModel.cols, height: GameModel.rows), contentMode: .fit)
            HStack{
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    Text("Back")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .stroke(lineWidth: 2.0)
                        )
                }
                Spacer()
                Button {
                    showsRestartAlert = true
                } label: {
                    Text("Restart")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .stroke(lineWidth: 2.0)
                        )
                }
                Spacer()
            }
        }
        .background(
            LinearGradient(colors: [.yellow,.white], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .alert(isPresented: $showsRestartAlert) {
            Alert(title: Text("Restart?"),
                  message: Text("Do you want to restart game?"),
                  primaryButton: .default(Text("Restart")){game.start()},
                  secondaryButton: .cancel())
        }
        .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(prefix: "f")
    }
}
