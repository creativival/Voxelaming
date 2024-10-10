import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(0.5)
            vox.setBuildInterval(0.01)

            vox.setCommand("japaneseCastle")

            try await vox.sendData(name: "japaneseCastle")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
