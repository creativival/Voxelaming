import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let buildBox = BuildBox(roomName: roomName)
    buildBox.setBoxSize(0.5)
    buildBox.setBuildInterval(0.01)
    let t = Turtle(buildBox: buildBox)

    Task {
        do {
            t.setColor(1, 0, 0, 1)
            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)

            t.up(90)
            t.forward(10)
            t.down(90)
            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)

            try await buildBox.sendData()
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
