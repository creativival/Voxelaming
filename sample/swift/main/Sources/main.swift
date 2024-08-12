import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let buildBox = BuildBox(roomName: roomName)
            buildBox.setBoxSize(0.5)
            buildBox.setBuildInterval(0.01)

            for i in 0..<100 {
                buildBox.createBox(-1, Double(i), 0, r: 0, g: 1, b: 1)
                buildBox.createBox(0, Double(i), 0, r: 1, g: 0, b: 0)
                buildBox.createBox(1, Double(i), 0, r: 1, g: 1, b: 0)
                buildBox.createBox(2, Double(i), 0, r: 0, g: 1, b: 1)
            }

            for i in 0..<50 {
                buildBox.removeBox(0, Double(i * 2), 0)
                buildBox.removeBox(1, Double(i * 2 + 1), 0)
            }

            try await buildBox.sendData(name: "main")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
