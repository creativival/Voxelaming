import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let buildBox = BuildBox(roomName: roomName)
    buildBox.setBoxSize(0.5)
    buildBox.setBuildInterval(0.01)

    Task {
        do {
            buildBox.drawLine(0, 0, 0, 5, 10, 20, r: 1, g: 0, b: 0, alpha: 1)

            try await buildBox.sendData()
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
