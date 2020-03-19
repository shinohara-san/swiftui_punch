import SwiftUI

struct ImageView: View {
    @Binding var imageIndex: Int
    var imageArray = ["ossan", "hit", "ko"]

    var body: some View {
        Image(imageArray[imageIndex]).resizable().padding().frame(width: 380.0, height: 550.0)
    }
    
    
}
