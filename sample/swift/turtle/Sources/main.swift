import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(0.5)
            vox.setBuildInterval(0.01)
            let t = Turtle(vox: vox)

            t.setColor(1, 0, 0, 1)

            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)

            t.up(90)
            t.forward(10)
            t.down(90)

            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)
            t.forward(10)
            t.left(90)

            try await vox.sendData(name: "turtle")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
