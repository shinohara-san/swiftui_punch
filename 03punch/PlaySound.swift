import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String){
    if let path = Bundle.main.path(forResource: sound, ofType: "mp3"){
        do {
           audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }
    }
}
