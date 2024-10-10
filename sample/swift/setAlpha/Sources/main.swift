import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(0.5)
            vox.setBuildInterval(0.01)

            for i in 0..<100 {
                let alpha = Double(100 - i) / 100
                vox.createBox(-1, Double(i), 0, r: 0, g: 1, b: 1, alpha: alpha)
                vox.createBox(0, Double(i), 0, r: 1, g: 0, b: 0, alpha: alpha)
                vox.createBox(1, Double(i), 0, r: 1, g: 1, b: 0, alpha: alpha)
                vox.createBox(2, Double(i), 0, r: 0, g: 1, b: 1, alpha: alpha)
            }

            for i in 0..<50 {
                vox.removeBox(0, Double(i * 2), 0)
                vox.removeBox(1, Double(i * 2 + 1), 0)
            }

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
