import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let buildBox = BuildBox(roomName: roomName)

    buildBox.setBoxSize(0.5)
    buildBox.setBuildInterval(0.01)

    let t = Turtle(buildBox: buildBox)

    let colors: [[Double]] = [
        [0, 0, 0, 1],
        [1, 0, 0, 1],
        [0, 1, 0, 1],
        [0, 0, 1, 1],
        [1, 1, 0, 1],
        [0, 1, 1, 1],
        [1, 0, 1, 1],
        [1, 1, 1, 1],
        [0.5, 0, 0, 1],
        [0, 0.5, 0, 1],
        [0, 0, 0.5, 1],
        [0.5, 0.5, 0, 1],
        [0, 0.5, 0.5, 1],
        [0.5, 0, 0.5, 1],
        [0.5, 0.5, 0.5, 1]
    ]

    for (j, color) in colors.enumerated() {
        let polarPhi = Double(j) * 180.0 / Double(colors.count)
        t.reset()
        t.setColor(color[0], color[1], color[2], color[3])

        t.left(polarPhi)

        for _ in 0..<60 {
            t.forward(4)
            t.up(6)
        }
    }

    buildBox.sendData()

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
