//
//  CountryDetailView.swift
//  Flags
//
//  Created by 홍길동 on 2022/07/13.
//

import SwiftUI

struct CountryDetailView: View {
    var country: (name:String, file:String)
    var body: some View {
        List {
            Image(country.file)
                .resizable()
                .frame(width: 240, height: 240)
            Text("\(country.name)")
                .font(.largeTitle)
            HStack {
                Text("Population : ")
                Text("\(country.name.count) million people")
                    .frame(maxWidth: .infinity, alignment: .trailing)//trailing : 오른쪽으로 붙임
            }
            HStack {
                Text("GDP : ")
                Text("\(country.name.count*15)$")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            ForEach(0..<country.name.count){index in
                let si = country.name.startIndex
                let ei = country.name.index(si, offsetBy: index+1)
                let subs = String(country.name[si..<ei])
                Text("Item \(index+1) : \(subs)")
            }
        }.navigationTitle(country.name)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: Nations.contintents[0].countries[0])
    }
}
