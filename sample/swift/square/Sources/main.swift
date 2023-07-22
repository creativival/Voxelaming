import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let buildBox = BuildBox(roomName: roomName)

    let radius = 11

    buildBox.setBoxSize(0.5)
    buildBox.setBuildInterval(0.01)
    buildBox.setNode(0, Double(radius), 0)

    for i in -radius...radius {
      for j in -radius...radius {
        for k in -radius...radius {
          if (radius - 1) * (radius - 1) <= i * i + j * j + k * k, i * i + j * j + k * k < radius * radius {
            print(i, j, k)
            buildBox.createBox(Double(i), Double(j), Double(k), r: 0, g: 1, b: 1)
          }
        }
      }
    }

    buildBox.sendData()

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
