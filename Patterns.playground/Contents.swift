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

class VideoFile {}

class OggCompressionCodec {}

class MPEG4CompressionCodec {}

class Converter {
    func convert(filename: String, format: String) {
        var file = VideoFile()
        print("Created file \(file)")
        
        if (format == "mp4") {
            var destinationCodec = MPEG4CompressionCodec()
            print("Converting to mp4")
        } else {
            var destinationCodec = OggCompressionCodec()
            print("Converting to ogg")
        }
    }
}

var video = Converter()
video.convert(filename: "Test", format: "mp4")



