import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    // Assuming that the BuildBox class is defined elsewhere with necessary methods
    let roomName = "1000"
    let buildBox = BuildBox(roomName: roomName)

    buildBox.setCommand("axis")
    buildBox.setBoxSize(1)
    buildBox.setBuildInterval(0.01)

    let colors: [[Double]] = [
      [0, 0, 0],
      [1, 0, 0],
      [0, 1, 0],
      [0, 0, 1],
      [1, 1, 0],
      [1, 0, 1],
      [0, 1, 1],
      [1, 1, 1],
      [0.5, 0.5, 0.5],
      [0.5, 0, 0],
      [0, 0.5, 0],
      [0, 0, 0.5],
      [0.5, 0.5, 0],
      [0.5, 0, 0.5]
    ]

    for (i, color) in colors.enumerated() {
      buildBox.createBox(0, Double(i), 0, r: color[0], g: color[1], b: color[2], alpha: 1)
    }

    buildBox.setLight(1, 1, 0, r: 1, g: 0, b: 0, alpha: 1, intensity: 1000, interval: 1)
    buildBox.setLight(0, 1, 1, r: 0, g: 1, b: 0, alpha: 1, intensity: 1000, interval: 1)

    buildBox.sendData()

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
