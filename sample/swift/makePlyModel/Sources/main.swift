import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let buildBox = BuildBox(roomName: roomName)
            buildBox.setBoxSize(0.5)
            buildBox.setBuildInterval(0.01)

            let plyFile = Constants().piyo
            let boxes = getBoxesFromPly(plyFile)
//             print(boxes.count)

            for b in boxes {
                buildBox.createBox(b.x, b.y, b.z, r: b.r, g: b.g, b: b.b, alpha: b.alpha)
            }

            try await buildBox.sendData(name: "Piyo")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
