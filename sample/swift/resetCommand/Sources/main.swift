import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let animationSettings: [[String: Any]] = [
        ["model": constants.frog1, "position": [0, 0, 0, 0, 0, 0]],
        ["model": constants.frog2, "position": [0, 0, 0, 0, 0, 0]],
        ["model": constants.frog3, "position": [0, 0, 0, 0, 0, 0]],
        ["model": constants.frog4, "position": [0, 5, 0, 0, 0, 0]],
        ["model": constants.frog5, "position": [0, 10, 0, 0, 0, 0]],
        ["model": constants.frog4, "position": [0, 5, 0, 0, 0, 0]],
        ["model": constants.frog3, "position": [0, 0, 0, 0, 0, 0]],
        ["model": constants.frog2, "position": [0, 0, 0, 0, 0, 0]]
    ]
    let constants = Constants()
    let buildBox = BuildBox(roomName: roomName)

    Task {
        do {
            for _ in 0..<3 {
                for setting in animationSettings {
                    guard let plyFile = setting["model"] as? String,
                          let position = setting["position"] as? [Int] else {
                        continue
                    }

                    for b in getBoxesFromPly(plyFile) {
                        buildBox.createBox(b.x, b.y, b.z, r: b.r, g: b.g, b: b.b, alpha: b.alpha)
                    }

                    buildBox.setBoxSize(0.5)
                    buildBox.setBuildInterval(0)
                    let x = Double(position[0])
                    let y = Double(position[1])
                    let z = Double(position[2])
                    let pitch = Double(position[3])
                    let yaw = Double(position[4])
                    let roll = Double(position[5])
                    buildBox.translate(x, y, z, pitch: pitch, yaw: yaw , roll: roll)
                    try await buildBox.sendData()
                    sleep(1)

                    buildBox.clearData()
                    buildBox.setCommand("reset")
                    try await buildBox.sendData()
                    sleep(1)

                    buildBox.clearData()
                    sleep(1)
                }
            }
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}