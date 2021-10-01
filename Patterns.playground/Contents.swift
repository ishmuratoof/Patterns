//Factory method

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

//State

class State {
    private var state: String
    
    init(state: String) {
        self.state = state
    }
    
    func updateState(state: String) {
        print("Updating state to \(state)")
        self.state = state
    }
}

class Create {
    private var document: String
    private var state = State(state: "")
    
    init(document: String) {
        self.document = document
    }
    
    func createDocument() {
        print("Creating a document")
        state.updateState(state: "Created")
    }
}

class Edit {
    private var document: String
    private var state = State(state: "")
    
    init(document: String) {
        self.document = document
    }
    
    func editDocument() {
        print("Editing a document")
        state.updateState(state: "edited")
    }
}

//Facade

class VideoFile {
    let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
}

class OggCompressionCodec {}

class MPEG4CompressionCodec {}

class Converter {
    
    enum Formats {
        case mp4, ogg
    }
    
    func convert(fileName: String, format: Formats) {
        var file = VideoFile(fileName: "filename")
        print("Created file \(file)")
        
        switch format {
            case .mp4:
                print("Converting to mp4")
                var destinationCodec = MPEG4CompressionCodec()
            case .ogg:
                print("Converting to ogg")
                var destinationCodec = OggCompressionCodec()
            default:
                print("Not appropriate format")
        }
    }
}

var video = Converter()
video.convert(fileName: "Test", format: .ogg)



