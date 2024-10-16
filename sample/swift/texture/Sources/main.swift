import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let textureNames = ["grass", "stone", "dirt", "planks", "bricks"]
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)

            vox.setBoxSize(1)
            vox.setBuildInterval(0.01)
            for (i, texture) in textureNames.enumerated() {
               vox.createBox(0, Double(textureNames.count - i - 1), 0, texture: texture)
            }
            try await vox.sendData()
            vox.clearData()
            try await vox.sleepSeconds(0.5) // 0.5秒待機

            vox.setBoxSize(1)
            vox.setBuildInterval(0.01)
            vox.changeShape("sphere")
            for (i, texture) in textureNames.enumerated() {
               vox.createBox(1, Double(textureNames.count - i - 1), 0, texture: texture)
            }
            try await vox.sendData()
            vox.clearData()
            try await vox.sleepSeconds(0.5) // 0.5秒待機

            vox.setBoxSize(1)
            vox.setBuildInterval(0.01)
            vox.changeShape("plane")
            for (i, texture) in textureNames.enumerated() {
               vox.createBox(2, Double(textureNames.count - i - 1), 0, texture: texture)
            }
            try await vox.sendData()
            vox.clearData()
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
