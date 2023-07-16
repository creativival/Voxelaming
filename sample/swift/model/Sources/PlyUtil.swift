import Foundation

struct BoxData: Hashable {
    let x: Double
    let y: Double
    let z: Double
    let r: Double
    let g: Double
    let b: Double
    let alpha: Double
}

func getBoxesFromPly(_ plyFile: String) -> Set<BoxData> {
    print("getBoxesFromPly")
    var boxPositions = Set<BoxData>()

    if let filePath = Bundle.main.path(forResource: "piyo", ofType: "ply") {
        print("filePath: \(filePath)")
        do {
            let lines = try String(contentsOfFile: filePath, encoding: .utf8)
            let positions = lines
                .replacingOccurrences(of: "\r\n", with: "\n")
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .components(separatedBy: "\n")
                .filter { isIncludedSixNumbers(line: $0) }
                .map { $0.split(separator: " ").compactMap { Double($0) } }

            let numberOfFaces = positions.count / 4
            print("numberOfFaces: \(numberOfFaces)")
            for i in 0..<numberOfFaces {
                let vertex1 = positions[i * 4]
                let vertex2 = positions[i * 4 + 1]
                let vertex3 = positions[i * 4 + 2]
//                 let vertex4 = positions[i * 4 + 3]  // no need
                var x: Double = min(vertex1[0], vertex2[0], vertex3[0])
                var y: Double = min(vertex1[1], vertex2[1], vertex3[1])
                var z: Double = min(vertex1[2], vertex2[2], vertex3[2])
                let r: Double = vertex1[3] / 255
                let g: Double = vertex1[4] / 255
                let b: Double = vertex1[5] / 255
                let alpha: Double = 1.0
                var step: Double = 0

                // ボックスを置く方向を解析
                if vertex1[0] == vertex2[0] && vertex2[0] == vertex3[0] {  // y-z plane
                    step = max(vertex1[1], vertex2[1], vertex3[1]) - y
                    if vertex1[1] != vertex2[1] {
                        x -= step
                    }
                } else if vertex1[1] == vertex2[1] && vertex2[1] == vertex3[1] {  // z-x plane
                    step = max(vertex1[2], vertex2[2], vertex3[2]) - z
                    if vertex1[2] != vertex2[2] {
                        y -= step
                    }
                } else {  // x-y plane
                    step = max(vertex1[0], vertex2[0], vertex3[0]) - x
                    if vertex1[0] != vertex2[0] {
                        z -= step
                    }
                }

                // minimum unit: 0.1
                let positionX = floor(round(x * 10.0 / step) / 10.0)
                let positionY = floor(round(y * 10.0 / step) / 10.0)
                let positionZ = floor(round(z * 10.0 / step) / 10.0)
                print("x: \(positionX), y: \(positionY), z: \(positionZ)")
                let position = BoxData(x: positionX, y: positionY, z: positionZ, r: r, g: g, b: b, alpha: alpha)
                boxPositions.insert(position)
            }
        } catch {
            print("Error: \(error)")
        }
    } else {
         // ファイルが見つからなかった場合の処理
         print("File not found")
     }

    return boxPositions
}

func isIncludedSixNumbers(line: String) -> Bool {
    let lineList = line.split(separator: " ")
    if lineList.count != 6 {
        return false
    }
    for item in lineList {
        if let _ = Double(item) {
            continue
        } else {
            return false
        }
    }
    return true
}
