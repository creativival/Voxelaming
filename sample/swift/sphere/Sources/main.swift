import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let radius = 20
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(0.5)
            vox.setBuildInterval(0.01)
            vox.transform(0, Double(radius), 0)

            for i in -radius...radius {
              for j in -radius...radius {
                for k in -radius...radius {
                  if (radius - 1) * (radius - 1) <= i * i + j * j + k * k, i * i + j * j + k * k < radius * radius {
                    print(i, j, k)
                    vox.createBox(Double(i), Double(j), Double(k), r: 0, g: 1, b: 1)
                  }
                }
              }
            }

            try await vox.sendData(name: "sphere")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
