import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let buildBox = BuildBox(roomName: roomName)
            buildBox.setBoxSize(10)
            buildBox.setBuildInterval(0.01)
            buildBox.setCommand("axis")
            buildBox.changeShape("sphere")

            buildBox.createBox(0, 0, 0, r: 1, g: 0, b: 0)
            buildBox.createModel(modelName: "Earth", x: 0, y: 2, z: 0, pitch: 0, yaw: 0, roll: 0, scale: 1)
            buildBox.createModel(modelName: "ToyCar", x: 0, y: 4, z: 0, pitch: 90, yaw: 0, roll: 0, scale: 1)
            buildBox.createModel(modelName: "ToyBiplane", x: 0, y: 6, z: 0, pitch: 0, yaw: 90, roll: 0, scale: 1)
            buildBox.createModel(modelName: "Robot", x: 0, y: 8, z: 0, pitch: 0, yaw: 0, roll: 90, scale: 1)
            buildBox.createModel(modelName: "Skull", x: 0, y: 10, z: 0, pitch: 0, yaw: 0, roll: 90, scale: 1)
            buildBox.createModel(modelName: "Skull", x: 0, y: 12, z: 0, pitch: 90, yaw: 0, roll: 0, scale: 1)
            buildBox.createModel(modelName: "Skull", x: 0, y: 14, z: 0, pitch: 90, yaw: 0, roll: 90, scale: 1)

            try await buildBox.sendData(name: "CreateModel")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
