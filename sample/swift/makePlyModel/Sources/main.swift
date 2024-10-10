import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(0.5)
            vox.setBuildInterval(0.01)

            let plyFile = Constants().piyo
            let boxes = getBoxesFromPly(plyFile)
//             print(boxes.count)

            for b in boxes {
                vox.createBox(b.x, b.y, b.z, r: b.r, g: b.g, b: b.b, alpha: b.alpha)
            }

            try await vox.sendData(name: "Piyo")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
