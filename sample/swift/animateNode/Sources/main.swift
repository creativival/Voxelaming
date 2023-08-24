import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let buildBox = BuildBox(roomName: roomName)

    buildBox.setBoxSize(0.5)
    buildBox.setBuildInterval(0.01)

    for i in 0..<10 {
        buildBox.createBox(-1, Double(i), 0, r: 0, g: 1, b: 1)
        buildBox.createBox(0, Double(i), 0, r: 1, g: 0, b: 0)
        buildBox.createBox(1, Double(i), 0, r: 1, g: 1, b: 0)
        buildBox.createBox(2, Double(i), 0, r: 0, g: 1, b: 1)
    }

    for i in 0..<5 {
        buildBox.removeBox(0, Double(i * 2), 0)
        buildBox.removeBox(1, Double(i * 2 + 1), 0)
    }

    buildBox.sendData()
    sleep(1)

    buildBox.animate(10, 0, 0, pitch: 0, yaw: 30 , roll: 0, scale: 2, interval: 10)
    buildBox.sendData()

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
