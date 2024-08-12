import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let textureNames = ["grass", "stone", "dirt", "planks", "bricks"]
            let roomName = "1000"
            let buildBox = BuildBox(roomName: roomName)

            buildBox.setBoxSize(1)
            buildBox.setBuildInterval(0.01)
            for (i, texture) in textureNames.enumerated() {
               buildBox.createBox(0, Double(textureNames.count - i - 1), 0, texture: texture)
            }
            try await buildBox.sendData()
            buildBox.clearData()
            sleep(1)

            buildBox.setBoxSize(1)
            buildBox.setBuildInterval(0.01)
            buildBox.changeShape("sphere")
            for (i, texture) in textureNames.enumerated() {
               buildBox.createBox(1, Double(textureNames.count - i - 1), 0, texture: texture)
            }
            try await buildBox.sendData()
            buildBox.clearData()
            sleep(1)

            buildBox.setBoxSize(1)
            buildBox.setBuildInterval(0.01)
            buildBox.changeShape("plane")
            for (i, texture) in textureNames.enumerated() {
               buildBox.createBox(2, Double(textureNames.count - i - 1), 0, texture: texture)
            }
            try await buildBox.sendData()
            buildBox.clearData()
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
