import Foundation

class Stopwatch : ObservableObject {
    
    @Published var counter = 0
    
    var timer = Timer()
    
    func start() {
        counter = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.counter += 1
        }
    }
    
    func stop(){
        timer.invalidate()
    }
}

