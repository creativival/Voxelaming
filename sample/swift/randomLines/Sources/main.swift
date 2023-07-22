import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let buildBox = BuildBox(roomName: roomName)

    buildBox.setBoxSize(0.5)
    buildBox.setBuildInterval(0.01)
    buildBox.setNode(0, 30, 0, pitch: 0, yaw: 0, roll: 0)

    for _ in 0..<100 {
        let x = CGFloat.random(in: -30...30)
        let y = CGFloat.random(in: -30...30)
        let z = CGFloat.random(in: -30...30)
        let r = CGFloat.random(in: 0...1)
        let g = CGFloat.random(in: 0...1)
        let b = CGFloat.random(in: 0...1)
        buildBox.drawLine(0, 0, 0, x, y, z, r: r, g: g, b: b, alpha: 1)
    }

    buildBox.sendData()

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
