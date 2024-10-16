import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(0.5)
            vox.setBuildInterval(0.01)

            for i in 0..<10 {
                vox.createBox(-1, Double(i), 0, r: 0, g: 1, b: 1)
                vox.createBox(0, Double(i), 0, r: 1, g: 0, b: 0)
                vox.createBox(1, Double(i), 0, r: 1, g: 1, b: 0)
                vox.createBox(2, Double(i), 0, r: 0, g: 1, b: 1)
            }

            for i in 0..<5 {
                vox.removeBox(0, Double(i * 2), 0)
                vox.removeBox(1, Double(i * 2 + 1), 0)
            }

            try await vox.sendData()
            try await vox.sleepSeconds(0.5) // 0.5秒待機

            vox.animate(10, 0, 0, pitch: 0, yaw: 30 , roll: 0, scale: 2, interval: 10)
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
