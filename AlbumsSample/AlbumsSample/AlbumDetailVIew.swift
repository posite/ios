//
//  AlbumDetailVIew.swift
//  AlbumsSample
//
//  Created by 홍길동 on 2022/07/15.
//

import SwiftUI

struct AlbumDetailVIew: View {
    let album : Album
    var body: some View {
        List {
            Image(systemName: "music.note")
                .resizable()
                .frame(width: 240, height: 240)
            HStack {
                Text("Album Title")
                Text(album.albumTitle)
                    .frame(maxWidth: .infinity, alignment: .trailing)//trailing : 오른쪽으로 붙임
            }
            HStack {
                Text("Artist name")
                Text(album.artistName)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            ForEach(0..<album.albumTitle.count){index in
                let si = album.albumTitle.startIndex
                let ei = album.albumTitle.index(si, offsetBy: index+1)
                let subs = String(album.albumTitle[si..<ei])
                Text("Item \(index+1) : \(subs)")
            }
        }.navigationTitle(album.albumTitle)
    }
}

struct AlbumDetailVIew_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailVIew(album: Album(albumTitle: "album", artistName: "artist", image: "???"))
    }
}
