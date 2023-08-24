import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let size: Double = 1.0
    let radius = 1.5 * size
    let repeatCount = 100

    let buildBox = BuildBox(roomName: roomName)
    buildBox.setBuildInterval(0.01)
    buildBox.setBoxSize(size)
    buildBox.changeShape("sphere")
    buildBox.setCommand("float")

    for i in 0..<repeatCount {
        let angle = Double(i) * 720.0 / Double(repeatCount) * .pi / 180.0
        let x = radius * cos(angle)
        let y = Double(i)
        let z = radius * sin(angle)

        buildBox.createBox(x, y, z, r: 0, g: 1, b: 1, alpha: 1)
        buildBox.createBox(-x, y, -z, r: 0, g: 1, b: 1, alpha: 1)
        if i % 2 == 0 {
            buildBox.createBox(x / 3, y, z / 3, r: 1, g: 0, b: 0, alpha: 1)
        } else {
            buildBox.createBox(-x / 3, y, -z / 3, r: 1, g: 1, b: 0, alpha: 1)
        }
    }

    buildBox.sendData()

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
