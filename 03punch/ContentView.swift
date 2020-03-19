import SwiftUI


struct ContentView: View {
    
    @State var life = 100
    @State var count = 0
    @State var isDead = false
    @State var index = 0
    @ObservedObject var stopwatch = Stopwatch()
    @State var timerIsRunning = false
    
    func damage(punchSoundName: String){
        if life == 0{
            return
        } else if life == 10{
            isDead = true
            index = 2
            playSound(sound: "gong")
            life -= 10
            stopwatch.stop()
            timerIsRunning = false
        }
        else {
            playSound(sound: punchSoundName)
            index = 1
            life -= 10
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.index = 0
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Life: \(life)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("ボコした回数: \(count)回")
                    .font(.title)
                Text(String(self.stopwatch.counter) + "秒").font(.title)
                Spacer()
                ImageView(imageIndex: $index)
                Spacer()
                HStack {
                    Button(action: {
                        if !self.timerIsRunning{
                            self.timerIsRunning = true
                            self.stopwatch.start()
                        }
                        self.damage(punchSoundName:  "punch1")
                    }) {
                        Text("ジャブ")
                            .fontWeight(.bold)
                    }.frame(width: 70.0).foregroundColor(.white).padding().background(Color.green).cornerRadius(10)
                    Button(action: {
                        if !self.timerIsRunning{
                            self.timerIsRunning = true
                            self.stopwatch.start()
                        }
                        self.damage(punchSoundName:  "punch2")
                    }) {
                        Text("ストレート")
                            .fontWeight(.bold)
                    }.frame(width: 90.0).foregroundColor(.white).padding().background(Color.red).cornerRadius(10)
                    Button(action: {
                        if !self.timerIsRunning{
                            self.timerIsRunning = true
                            self.stopwatch.start()
                        }
                        self.damage(punchSoundName:  "punch3")
                    }) {
                        Text("アッパー")
                            .fontWeight(.bold)
                    }.frame(width: 70.0).foregroundColor(.white).padding().background(Color.blue).cornerRadius(10)
                    //                    PunchButton(punchName: .constant("ジャブ"), bgColor: .constant(.green), punchSoundName: .constant("punch1"))
                    //                    PunchButton(punchName: .constant("ストレート"), bgColor: .constant(.red), punchSoundName: .constant("punch2"))
                    //                    PunchButton(punchName: .constant("アッパー"), bgColor: .constant(.blue), punchSoundName: .constant("punch3"))
                    
                }.alert(isPresented: $isDead, content: {
                    Alert(title: Text("終了"), message: Text("おっさんをやっつけました。"), primaryButton: .default(Text("今日はこのへんで"), action:{}), secondaryButton: .default(Text("もっとボコボコにする"), action:{
                        self.count += 1
                        self.life = 100
                        self.stopwatch.counter = 0
                        self.index = 0
                    }))
                })
                Spacer()
            }
        }
        
    }
}

//struct PunchButton: View {
//
////    UIは関数化できているが、lifeや秒数、画像が変わらない。stateとかbindingが怪しい。
//
//    @Binding var punchName: String
//    @Binding var bgColor: Color
//    @Binding var punchSoundName: String
//
//   @State var life = 100
//   @State var count = 0
//   @State var isDead = false
//   @State var index = 0
//   @ObservedObject var stopwatch = Stopwatch()
//   @State var timerIsRunning = false
//
//    func damage(punchSoundName: String){
//           if life == 0{
//               return
//           } else if life == 10{
//               isDead = true
//               index = 2
//               playSound(sound: "gong")
//               life -= 10
//               stopwatch.stop()
//               timerIsRunning = false
//           }
//           else {
//               playSound(sound: punchSoundName)
//               index = 1
//               life -= 10
//               DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//                   self.index = 0
//               }
//           }
//       }
//
//    var body: some View{
//      Button(action: {
//          if !self.timerIsRunning{
//              self.timerIsRunning = true
//              self.stopwatch.start()
//          }
//        self.damage(punchSoundName: self.punchSoundName)
//      }) {
//          Text(punchName)
//              .fontWeight(.bold)
//      }.frame(width: 70.0).foregroundColor(.white).padding().background(bgColor).cornerRadius(10)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
