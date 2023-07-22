import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let buildBox = BuildBox(roomName: roomName)

    buildBox.setBoxSize(0.5)
    buildBox.setBuildInterval(0.01)

    let plyFileName = "piyo"
    let boxes = getBoxesFromPly(plyFileName)
    print(boxes.count)

    for b in boxes {
        buildBox.createBox(b.x, b.y, b.z, r: b.r, g: b.g, b: b.b, alpha: b.alpha)
    }

    buildBox.sendData()

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
