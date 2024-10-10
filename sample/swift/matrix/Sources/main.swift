import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    // Edit outer code here.
    let roomName = "1000"
    let angleToOpen = 30.0
    let lengthRatio = 0.8
    let initialLength = 10.0
    let repeatCount = 5
    let vox = VoxelammingSwift(roomName: roomName)
    vox.changeShape("sphere")
    vox.setCommand("float")

    Task {
        do {
            // Edit code here.
            vox.drawLine(0, 0, 0, 0, initialLength, 0, r: 0, g: 1, b: 1)

            drawThreeBranches(count: repeatCount, branchLength: initialLength)

            try await vox.sendData()
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs

    @Sendable func drawThreeBranches(count: Int, branchLength: Double) {
        let count = count - 1
        if count < 0 {
            return
        }

        let shortedBranchLength = branchLength * lengthRatio
//         print("push_matrix")
        vox.pushMatrix()

        // First branch
        vox.transform(0, branchLength, 0, pitch: angleToOpen, yaw: 0, roll: 0)
        vox.drawLine(0, 0, 0, 0, shortedBranchLength, 0, r: 1, g: 0, b: 1)
        drawThreeBranches(count: count, branchLength: shortedBranchLength)

        // Second branch
        vox.transform(0, branchLength, 0, pitch: angleToOpen, yaw: 120, roll: 0)
        vox.drawLine(0, 0, 0, 0, shortedBranchLength, 0, r: 1, g: 0, b: 0)
        drawThreeBranches(count: count, branchLength: shortedBranchLength)

        // Third branch
        vox.transform(0, branchLength, 0, pitch: angleToOpen, yaw: 240, roll: 0)
        vox.drawLine(0, 0, 0, 0, shortedBranchLength, 0, r: 1, g: 1, b: 0)
        drawThreeBranches(count: count, branchLength: shortedBranchLength)

//         print("pop_matrix")
        vox.popMatrix()
    }
    // Edit outer code here.
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
