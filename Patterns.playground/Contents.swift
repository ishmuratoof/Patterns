//MARK: Factory method

protocol TransportBuilding {
    func makeTransport() -> Transport
}

protocol Transport {
    func beep()
}

class Truck: TransportBuilding, Transport {
    func beep() {
        print("beep")
    }
    
    func makeTransport() -> Transport {
        return Truck()
    }
}

class Car: TransportBuilding, Transport {
    func beep() {
        print("beep")
    }
    
    func makeTransport() -> Transport {
        return Car()
    }
}

class Airplane: TransportBuilding, Transport {
    func beep() {
        print("beep")
    }
    
    func makeTransport() -> Transport {
        return Airplane()
    }
}

//MARK: State

class Context {
    var state: State
    
    init(state: State) {
        self.state = state
    }
    
    func transitionTo(state: State) {
        self.state = state
    }
}

protocol State {
    var context: Context? { get }
    func changeLight()
}

class RedState: State {
    var context: Context?
    
    func changeLight() {
        print("Changing light to yellow")
        context?.transitionTo(state: YellowState())
    }
}

class YellowState: State {
    var context: Context?
        
    func changeLight() {
        print("Changing light to green")
        context?.transitionTo(state: GreenState())
    }
}

class GreenState: State {
    var context: Context?
    
    func changeLight() {
        print("Changing light to red")
        context?.transitionTo(state: RedState())
    }
}

//MARK: Facade

//Some external classes

class VideoFile {
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
}

class OggCompressionCodec {}

class MPEG4CompressionCodec {}

//My own class that's allows to work with other classes

class Converter {
    
    //Enumeration of available audio formats
    
    enum Formats {
        case mp4
        case ogg
    }
    
    //Convererting method
    
    func convert(fileName: String, format: Formats) {
        let file = VideoFile(fileName: "Some filename")
        print("Created file \(file)")
        
        switch format {
            case .mp4:
                print("Converting to mp4")
                MPEG4CompressionCodec()
            case .ogg:
                print("Converting to ogg")
                OggCompressionCodec()
        }
    }
}

var video = Converter()
video.convert(fileName: "Test", format: .ogg)



