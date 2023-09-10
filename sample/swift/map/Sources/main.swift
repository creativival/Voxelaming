import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let columnNum = 257
    let rowNum = 257
    let csvFile = constants.map_38_138_100km
    let heightScale = 100.0
    let highColor = (0.5, 0.0, 0.0)
    let lowColor = (0.0, 1.0, 0.0)
    let mapData = getMapDataFromCSV(csvFile: csvFile, heightScale: heightScale)
    let boxes = mapData["boxes"] as! [[Double]] // Assuming the data structure based on given Python code
    let maxHeight = mapData["maxHeight"] as! Double
//     let skip = 1  // high power device
    let skip = 2  // normal
//    let skip = 4  // low power device
    let buildBox = BuildBox(roomName: roomName)
    let constants = Constants()
    buildBox.setBoxSize(0.1)
    buildBox.setBuildInterval(0.001)
    buildBox.setCommand("liteRender")

    Task {
        do {
            for j in 0..<(rowNum / skip) {
                for i in 0..<(columnNum / skip) {
                    print(i, j)
                    let x = i - (columnNum / (skip * 2))
                    let z = j - (rowNum / (skip * 2))
                    let y = boxes[j * skip][i * skip]
                    let (r, g, b) = getBoxColor(height: y, maxHeight: maxHeight, highColor: highColor, lowColor: lowColor)

                    if y > 0 {
                        buildBox.createBox(Double(x), y, Double(z), r: r, g: g, b: b, alpha: 1.0)
                    }
                }
            }

            try await buildBox.sendData()
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
