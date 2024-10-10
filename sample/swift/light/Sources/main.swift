import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setCommand("axis")
            vox.setBoxSize(1)
            vox.setBuildInterval(0.01)

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
              [0.5, 0, 0.5],
              [0, 0.5, 0.5]
            ]

            for (i, color) in colors.enumerated() {
              vox.createBox(0, Double(i), 0, r: color[0], g: color[1], b: color[2], alpha: 1)
            }

            vox.setLight(1, 1, 0, r: 1, g: 0, b: 0, alpha: 1, intensity: 20000, interval: 2, lightType: "directional")
            vox.setLight(0, 1, 1, r: 0, g: 1, b: 0, alpha: 1, intensity: 20000, interval: 3, lightType: "spot")
            vox.setLight(-1, 1, 0, r: 0, g: 0, b: 1, alpha: 1, intensity: 20000, interval: 5, lightType: "point")

            try await vox.sendData(name: "light")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
