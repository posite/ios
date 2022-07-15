//
//  ContentView.swift
//  MapSample
//
//  Created by 홍길동 on 2022/07/15.
//

import SwiftUI

struct PoiLIstView: View {
    @ObservedObject var poiData = PoiData()
    var body: some View {
        NavigationView{
            List{
                ForEach(poiData.rows, id: \.RESTRT_NM ){ poi in
                    PoiItemView(poi: poi)
                }
            }
            .navigationBarTitle(Text("Restaurants"))
        }
        .onAppear {
            poiData.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PoiLIstView()
    }
}

struct PoiItemView: View {
    let poi : PoiItem
    var body: some View {
        NavigationLink {
            PoiDetailView(poi: poi)
        } label: {
            HStack{
                Image(systemName: "fork.knife.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading){
                    Text(poi.RESTRT_NM)
                        .font(.title)
                    Text(poi.REPRSNT_FOOD_NM)
                        .font(.headline)
                    Text(poi.REFINE_ROADNM_ADDR)
                        .lineLimit(1)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
