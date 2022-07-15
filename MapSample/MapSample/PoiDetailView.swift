//
//  PoiDetailView.swift
//  MapSample
//
//  Created by 홍길동 on 2022/07/15.
//

import SwiftUI
import MapKit

struct PoiDetailView: View {
    let poi : PoiItem
    var body: some View {
        GeometryReader{ gr in
            ScrollView(.vertical){
                VStack(alignment: .leading){
                    Group{
                        PropertyView(imageNamme: "tram.circle", text: poi.SIGUN_NM)
                        PropertyView(imageNamme: "location.circle", text: poi.SIGUN_CD)
                        PropertyView(imageNamme: "fork.knife.circle", text: poi.REPRSNT_FOOD_NM)
                        PropertyView(imageNamme: "phone.circle", text: poi.TASTFDPLC_TELNO)
                    }
                    //Map(coordinateRegion: <#T##Binding<MKCoordinateRegion>#>)
                }
            }
        }
    }
}

struct PoiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //PoiDetailView(poi: PoiItem())
    }
}

struct PropertyView: View {
    let imageNamme: String
    let text: String
    var body: some View {
        HStack{
            Image(systemName: imageNamme)
                .resizable()
                .frame(width: 30, height: 30)
            Text(text)
        }
    }
}
