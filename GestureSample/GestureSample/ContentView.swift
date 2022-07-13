//
//  ContentView.swift
//  GestureSample
//
//  Created by 홍길동 on 2022/07/13.
//
//press move release
//long press - duration
//tap(click) = touch up inside
//double tab....
//drag  pan -> translation(x,y좌표 이동)
//flick  fling - decelerating
//swipe -> direction
//pinch -> scale  줌
//rotation -> angle

import SwiftUI

struct ContentView: View {
//    let tap =TapGesture() gesture를 따로 빼놓을 수 있음
//        .onEnded{
//            count += 1
//        }
    @State var spinning = false
    @State var count = 0
    @State var visible = true
    @State var angle = Angle.zero
    
    var body: some View {
        let rot = RotationGesture()
            .onChanged { angle in
                print("Angle : \(angle)")
                self.angle = angle
            }
            .onEnded { _ in
                print("Rotation ended")
            }
        VStack {
            Text("count : \(count)  Angle : \(angle.degrees)")
                .rotationEffect(angle)
            ZStack {
                Circle()
                    .stroke(.blue,lineWidth: 5)
                    .background(Circle().fill(
                        RadialGradient(gradient: Gradient(colors: [Color.red,Color.orange,Color.green]), center: .center, startRadius: 0, endRadius: 50)
                    ))
                    .frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.red, lineWidth: 5)
                    .frame(width: 100, height: 100)
                Text("Tap Here")
                    .padding(100)
                    .border(Color.brown, width: 4)
                    .gesture(
                        TapGesture()
                            .onEnded{
                                count += 1
                            }
                )
            }
            .rotationEffect(.degrees(spinning ? 360:0))
            .animation(.linear(duration: 2)
                        .repeatForever(autoreverses: false), value: spinning ?  0:360)
            .onAppear{
                spinning = true
            }
            Toggle(isOn: $visible) {
                Text("Toggle")
            }
            .frame(width: 200)
            Button{
                
            }label:{
                Text("Capsule")
                    .padding(10)
                    .background(
                        Capsule()
                            .stroke()
                    )
            }
            Spacer()
            if visible {
                Path{path in
                    path.move(to: CGPoint(x: 200, y:100))
                    path.addLine(to: CGPoint(x: 100, y: 300))
                    path.addLine(to: CGPoint(x: 300, y: 300))
                    path.addLine(to: CGPoint(x: 200, y: 100))
                    path.closeSubpath()
                }.stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .miter))
            }
            HStack {
                Image(systemName: "moon.fill")
                    .resizable()
                    .padding()
                    .frame(width: 100, height: 100)
                Text("Rotate here")
            }
            .background(LinearGradient(colors: [Color.yellow,Color.white], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .gesture(rot)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
