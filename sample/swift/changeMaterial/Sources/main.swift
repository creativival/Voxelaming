import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
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

            for i in 0..<5 {
                vox.changeMaterial(isMetallic: false, roughness: 0.25 * Double(i))
                vox.transform(Double(i), 0, 0, pitch: 0, yaw: 0, roll: 0)
                try await vox.sendData()
                usleep(500_000) // 0.5秒待機
            }

            for i in 0..<5 {
                vox.changeMaterial(isMetallic: true, roughness: 0.25 * Double(i))
                vox.transform(Double(5 + i), 0, 0, pitch: 0, yaw: 0, roll: 0)
                try await vox.sendData()
                usleep(500_000) // 0.5秒待機
            }
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
