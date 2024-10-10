import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    Task {
        do {
            // Edit code here.
            let roomName = "1000"
            let vox = VoxelammingSwift(roomName: roomName)
            vox.setBoxSize(0.5)
            vox.setBuildInterval(0.01)

            // ボクセルを配置するため、位置と色を設定します
            // フォントサイズは、8, 12, 16, 24から選びます
            // isFixedWidthをtrueにすると、文字間隔が固定されます
            vox.writeSentence("Voxel", 0, 130, 0, r: 1, g: 0, b: 1, alpha: 1, fontSize: 24)
            vox.writeSentence("Voxel", 0, 106, 0, r: 1, g: 0, b: 1, alpha: 1, fontSize: 24, isFixedWidth: true)
            vox.writeSentence("Hello World", 0, 90, 0, r: 1, g: 0, b: 0, alpha: 1, fontSize: 16)
            vox.writeSentence("Hello World", 0, 64, 0, r: 1, g: 0, b: 0, alpha: 1, fontSize: 16, isFixedWidth: true)
            vox.writeSentence("こんにちは", 0, 48, 0, r: 0, g: 1, b: 0, alpha: 1, fontSize: 12)
            vox.writeSentence("こんにちは", 0, 32, 0, r: 0, g: 1, b: 0, alpha: 1, fontSize: 12, isFixedWidth: true)
            vox.writeSentence("今日は", 0, 16, 0, r: 0, g: 0, b: 1, alpha: 1, fontSize: 8)
            vox.writeSentence("今日は", 0, 0, 0, r: 0, g: 0, b: 1, alpha: 1, fontSize: 8, isFixedWidth: true)

            try await vox.sendData(name: "WriteSentence")
            // Edit code here.
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
