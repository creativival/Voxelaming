import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let angleToOpen = 30.0
    let lengthRatio = 0.6
    let initialLength = 10.0
    let repeatCount = 4
    let buildBox = BuildBox(roomName: roomName)
    buildBox.changeShape("sphere")
    buildBox.setCommand("float")

    Task {
        do {
            buildBox.drawLine(0, 0, 0, 0, initialLength, 0, r: 0, g: 1, b: 1)
            try await buildBox.sendData()
            sleep(1)

            await drawThreeBranches(count: repeatCount, branchLength: initialLength)
        } catch {
            print("An error occurred: \(error)")
        }
    }

    func drawThreeBranches(count: Int, branchLength: Double) async {
        var count = count - 1
        if count < 0 {
            return
        }

        do {
            let shortedBranchLength = branchLength * lengthRatio
            print("push_matrix")
            buildBox.pushMatrix()

            // First branch
            buildBox.clearData()
            buildBox.changeShape("sphere")
            buildBox.setCommand("float")
            buildBox.translate(0, branchLength, 0, pitch: angleToOpen, yaw: 0, roll: 0)
            buildBox.drawLine(0, 0, 0, 0, shortedBranchLength, 0, r: 1, g: 0, b: 1)
            try await buildBox.sendData()
            sleep(1)
            await drawThreeBranches(count: count, branchLength: shortedBranchLength)

            // Second branch
            buildBox.clearData()
            buildBox.changeShape("sphere")
            buildBox.setCommand("float")
            buildBox.translate(0, branchLength, 0, pitch: angleToOpen, yaw: 120, roll: 0)
            buildBox.drawLine(0, 0, 0, 0, shortedBranchLength, 0, r: 1, g: 0, b: 0)
            try await buildBox.sendData()
            sleep(1)
            await drawThreeBranches(count: count, branchLength: shortedBranchLength)

            // Third branch
            buildBox.clearData()
            buildBox.changeShape("sphere")
            buildBox.setCommand("float")
            buildBox.translate(0, branchLength, 0, pitch: angleToOpen, yaw: 240, roll: 0)
            buildBox.drawLine(0, 0, 0, 0, shortedBranchLength, 0, r: 1, g: 1, b: 0)
            try await buildBox.sendData()
            sleep(1)
            await drawThreeBranches(count: count, branchLength: shortedBranchLength)

            print("pop_matrix")
            buildBox.popMatrix()
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 120)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
