import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let rotations = [
        [0, 0, 0],
        [30, 0, 0],
        [0, 30, 0],
        [0, 0, 30]
    ]
    let buildBox = BuildBox(roomName: roomName)
    buildBox.setBoxSize(0.5)
    buildBox.setBuildInterval(0.01)

    Task {
        do {
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

            for rotation in rotations {
              let pitch = Double(rotation[0])
              let yaw = Double(rotation[1])
              let roll = Double(rotation[2])
              buildBox.translate(0, 0, 0, pitch: pitch, yaw: yaw , roll: roll)
              try await buildBox.sendData()
              sleep(1)
            }
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
