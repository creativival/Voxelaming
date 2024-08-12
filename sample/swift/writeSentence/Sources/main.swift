import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let buildBox = BuildBox(roomName: roomName)
            buildBox.setBoxSize(0.5)
            buildBox.setBuildInterval(0.01)

            buildBox.transform(0, 16, 0)
            buildBox.writeSentence("Hello, World", 0, 0, 0, r: 1, g: 0, b: 0)
            try await buildBox.sendData(name: "Hello, World")

            sleep(1)

            buildBox.transform(0, 0, 0)
            buildBox.writeSentence("こんにちは", 0, 0, 0, r: 0, g: 1, b: 0, alpha: 1)
            try await buildBox.sendData(name: "こんにちは")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
