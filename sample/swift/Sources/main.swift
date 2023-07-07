import Foundation

let roomName = "1000"

@available(iOS 15.0, macOS 12.0, *)
func main() async {
    do {
        let buildBox = BuildBox(roomName)

        buildBox.setBoxSize(0.5)
        buildBox.setBuildInterval(0.01)

        for i in 0..<100 {
            buildBox.createBox(-1, Double(i), 0, 0, 1, 1)
            buildBox.createBox(0, Double(i), 0, 1, 0, 0)
            buildBox.createBox(1, Double(i), 0, 1, 1, 0)
            buildBox.createBox(2, Double(i), 0, 0, 1, 1)
        }

        for i in 0..<50 {
            buildBox.removeBox(0, Double(i * 2), 0)
            buildBox.removeBox(1, Double(i * 2 + 1), 0)
        }
        try await buildBox.sendData()
    } catch {
        print("An error occurred: \(error)")
    }
}

if #available(iOS 15.0, macOS 12.0, *) {
    Task.detached(priority: .userInitiated) {
        await main()
    }
    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}

