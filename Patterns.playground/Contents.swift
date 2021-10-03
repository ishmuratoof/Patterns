//MARK: Factory method

protocol FactoryMethod {
    func transportGenerator() -> Transport
}

class Transport {
    func someOperation() { }
}

class Truck: FactoryMethod {
    func transportGenerator() -> Transport {
        return Transport()
    }
}

class Car: FactoryMethod {
    func transportGenerator() -> Transport {
        return Transport()
    }
}

class Airplane: FactoryMethod {
    func transportGenerator() -> Transport {
        return Transport()
    }
}

//MARK: State

//State protocol

protocol State {
    func someAction()
    func anotherAction()
}

// Context class

class Context {
    private var state: State
    
    init(state: State) {
        self.state = state
    }
    
    func transition(to state: State) { }
    
    func firstRequest() {
        state.someAction()
    }
    
    func secondRequest() {
        state.anotherAction()
    }
}

// Basic state class

class BasicState: State {
    weak var context: Context?
        
    func someAction() {}
    
    func anotherAction() {}
}

// First state class

class State1: BasicState {
    override func someAction() {
        print("State 1 makes first request and switches to the second state")
        context?.transition(to: State2())
    }
}

// Second state class

class State2: BasicState {
    override func someAction() {
        print("State 2 makes first request and switches to the first state")
        context?.transition(to: State1())
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



