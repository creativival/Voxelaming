import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(0.5)
            vox.setBuildInterval(0.001)
            vox.setCommand("liteRender")

            let t = Turtle(vox: vox)
            let colors: [[Double]] = [
                [0, 0, 0, 1],
                [1, 0, 0, 1],
                [0, 1, 0, 1],
                [0, 0, 1, 1],
                [1, 1, 0, 1],
                [0, 1, 1, 1],
                [1, 0, 1, 1],
        //         [1, 1, 1, 1],
        //         [0.5, 0, 0, 1],
        //         [0, 0.5, 0, 1],
        //         [0, 0, 0.5, 1],
        //         [0.5, 0.5, 0, 1],
        //         [0, 0.5, 0.5, 1],
        //         [0.5, 0, 0.5, 1],
        //         [0.5, 0.5, 0.5, 1]
            ]

            for (j, color) in colors.enumerated() {
                t.reset()
                t.setColor(color[0], color[1], color[2], color[3])

                t.setPos(x: Double(j), y: 0, z: 0)
                t.up(4)

                for _ in 0..<360 {
                    t.forward(3)
                    t.left(6)
                }
            }

            try await vox.sendData(name: "turtleSpiral")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
