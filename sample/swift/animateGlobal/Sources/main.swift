import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(0.3)
            vox.setBuildInterval(0.01)

            for i in 0..<10 {
                vox.createBox(-1, Double(i), 0, r: 0, g: 1, b: 1, alpha: 1)
                vox.createBox(0, Double(i), 0, r: 1, g: 0, b: 0, alpha: 1)
                vox.createBox(1, Double(i), 0, r: 1, g: 1, b: 0, alpha: 1)
                vox.createBox(2, Double(i), 0, r: 0, g: 1, b: 1, alpha: 1)
            }

            for i in 0..<5 {
                vox.removeBox(0, Double(i * 2 + 1), 0)
                vox.removeBox(1, Double(i * 2), 0)
            }

            let nodePositions: [[Double]] = [
                [0, 0, 0],
                [-10, 0, 0],
                [10, 0, 0],
                [0, -20, 0],
                [0, 20, 0],
                [0, 0, -10],
                [0, 0, 10]
            ]

            for position in nodePositions {
                let x = position[0]
                let y = position[1]
                let z = position[2]

                vox.transform(x, y, z, pitch: 0, yaw: 0, roll: 0)
                try await vox.sendData()
                try await vox.sleepSeconds(0.5) // 0.5秒待機
            }

            vox.clearData()
            vox.animateGlobal(0, 0, 0, pitch: 0, yaw: 180, roll: 0, scale: 1, interval: 100)
            try await vox.sendData()
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
