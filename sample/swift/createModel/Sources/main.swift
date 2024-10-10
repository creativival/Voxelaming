import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(10)
            vox.setBuildInterval(0.01)
            vox.setCommand("axis")
            vox.changeShape("sphere")

            vox.createBox(0, 0, 0, r: 1, g: 0, b: 0)
            vox.createModel(modelName: "Earth", x: 0, y: 2, z: 0, pitch: 0, yaw: 0, roll: 0, scale: 1)
            vox.createModel(modelName: "ToyCar", x: 0, y: 4, z: 0, pitch: 90, yaw: 0, roll: 0, scale: 1)
            vox.createModel(modelName: "ToyBiplane", x: 0, y: 6, z: 0, pitch: 0, yaw: 90, roll: 0, scale: 1)
            vox.createModel(modelName: "Robot", x: 0, y: 8, z: 0, pitch: 0, yaw: 0, roll: 90, scale: 1)
            vox.createModel(modelName: "Skull", x: 0, y: 10, z: 0, pitch: 0, yaw: 0, roll: 90, scale: 1)
            vox.createModel(modelName: "Skull", x: 0, y: 12, z: 0, pitch: 90, yaw: 0, roll: 0, scale: 1)
            vox.createModel(modelName: "Skull", x: 0, y: 14, z: 0, pitch: 90, yaw: 0, roll: 90, scale: 1)

            try await vox.sendData(name: "CreateModel")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
