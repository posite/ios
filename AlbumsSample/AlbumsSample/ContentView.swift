//
//  ContentView.swift
//  AlbumsSample
//
//  Created by 홍길동 on 2022/07/14.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var albumStore = AlbumStore.singleton
    var body: some View {
        NavigationView{
            List{
                ForEach(albumStore.albums, id:\.albumTitle){album in
                    NavigationLink(destination: Text("\(album.albumTitle)")) {
                        AlbumItemView(album: album)
                    }
                }
                
            }.navigationTitle(Text("Albums"))
        }
        .onAppear{albumStore.load()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AlbumItemView: View {
    static let imageSize = 50
    let album : Album
    var body: some View {
        HStack{
            Image(systemName: "music.note")
                .resizable()
                .frame(width: CGFloat(AlbumItemView.imageSize),
                       height: CGFloat(AlbumItemView.imageSize))
            VStack(alignment: .leading){
                Text("\(album.albumTitle)")
                    .font(.title2)
                Text("\(album.artistName)")
                    .font(.footnote)
                    .foregroundColor(.purple)
            }
        }
    }
}
