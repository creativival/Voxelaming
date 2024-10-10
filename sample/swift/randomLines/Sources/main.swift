import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(0.5)
            vox.setBuildInterval(0.01)
            vox.transform(0, 30, 0, pitch: 0, yaw: 0, roll: 0)

            for _ in 0..<100 {
                let x = CGFloat.random(in: -30...30)
                let y = CGFloat.random(in: -30...30)
                let z = CGFloat.random(in: -30...30)
                let r = CGFloat.random(in: 0...1)
                let g = CGFloat.random(in: 0...1)
                let b = CGFloat.random(in: 0...1)
                vox.drawLine(0, 0, 0, x, y, z, r: r, g: g, b: b, alpha: 1)
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
