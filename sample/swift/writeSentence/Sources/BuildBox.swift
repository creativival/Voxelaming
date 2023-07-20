import Foundation

@available(iOS 15.0, macOS 12.0, *)
class BuildBox {
    let url = URL(string: "wss://render-nodejs-server.onrender.com")!
    let webSocketTask: URLSessionWebSocketTask
    var roomName = ""
    var node: [Double] = [0, 0, 0, 0, 0, 0, 0]
    var animation: [Double] = [0, 0, 0, 0, 0, 0, 1, 0]
    var boxes = [[Double]]()
    var sentence = [String]()
    var size: Double = 1.0
    var shape: String = "box"
    var buildInterval = 0.01

    init(_ roomName: String) {
        self.roomName = roomName
        webSocketTask = URLSession.shared.webSocketTask(with: url)
    }

    func setNode(_ x: Double, _ y: Double, _  z: Double, pitch: Double = 0, yaw: Double = 0, roll: Double = 0) {
        let floorX = floor(x)
        let floorY = floor(y)
        let floorZ = floor(z)
        node = [floorX, floorY, floorZ, pitch, yaw, roll]
    }

    func animationNode(_ x: Double, _ y: Double, _  z: Double, pitch: Double = 0, yaw: Double = 0, roll: Double = 0, scale: Double = 1, interval: Double = 10) {
        let floorX = floor(x)
        let floorY = floor(y)
        let floorZ = floor(z)
        animation = [floorX, floorY, floorZ, pitch, yaw, roll, scale, interval]
    }

    func createBox(_ x: Double, _ y: Double, _  z: Double, r: Double = 1, g: Double = 1, b: Double = 1, alpha: Double = 1) {
        let floorX = floor(x)
        let floorY = floor(y)
        let floorZ = floor(z)
        // 重ねて置くことを防止するために、同じ座標の箱があれば削除する
        removeBox(floorX, floorY, floorZ)
        boxes.append([floorX, floorY, floorZ, r, g, b, alpha])
    }

    func removeBox(_ x: Double, _ y: Double, _ z: Double) {
        let floorX = floor(x)
        let floorY = floor(y)
        let floorZ = floor(z)
        for box in boxes {
            if (box[0] == floorX && box[1] == floorY && box[2] == floorZ) {
                boxes.remove(at: boxes.firstIndex(of: box)!)
            }
        }
    }

    func setBoxSize(_ boxSize: Double) {
        size = boxSize
    }

    func setBuildInterval(_ interval: Double) {
        buildInterval = interval
    }

    func clearData() {
        node = [0, 0, 0, 0, 0, 0, 0]
        animation = [0, 0, 0, 0, 0, 0, 1, 0]
        boxes = [[Double]]()
        boxes.removeAll()
        sentence.removeAll()
        size = 1.0
        shape = "box"
    }

    func writeSentence(_ string_sentence: String, _ x: Double, _ y: Double, _  z: Double, r: Double = 0, g: Double = 0, b: Double = 0, alpha: Double = 1) {
        let stringX = String(floor(x))
        let stringY = String(floor(y))
        let stringZ = String(floor(z))
        let stringR = String(r)
        let stringG = String(g)
        let stringB = String(b)
        let stringAlpha = String(alpha)
        sentence = [string_sentence, stringX, stringY, stringZ, stringR, stringG, stringB, stringAlpha]
    }

    func drawLine(_ x1: Double, _ y1: Double, _ z1: Double, _ x2: Double, _ y2: Double, _ z2: Double, r: Double = 1, g: Double = 1, b: Double = 1, alpha: Double = 1) {
        let x1 = floor(x1)
        let y1 = floor(y1)
        let z1 = floor(z1)
        let x2 = floor(x2)
        let y2 = floor(y2)
        let z2 = floor(z2)
        let diffX = x2 - x1
        let diffY = y2 - y1
        let diffZ = z2 - z1
        let maxLength = max(abs(diffX), abs(diffY), abs(diffZ))
        print(x2, y2, z2)

        if diffX == 0 && diffY == 0 && diffZ == 0 {
            return
        }

        if abs(diffX) == maxLength {
            if x2 > x1 {
                for x in Int(x1)...Int(x2) {
                    let y = y1 + (Double(x) - x1) * diffY / diffX
                    let z = z1 + (Double(x) - x1) * diffZ / diffX
                    createBox(Double(x), y, z, r: r, g: g, b: b, alpha: alpha)
                }
            } else {
                for x in stride(from: Int(x1), through: Int(x2 + 1), by: -1) {
                    let y = y1 + (Double(x) - x1) * diffY / diffX
                    let z = z1 + (Double(x) - x1) * diffZ / diffX
                    createBox(Double(x), y, z, r: r, g: g, b: b, alpha: alpha)
                }
            }
        } else if abs(diffY) == maxLength {
            if y2 > y1 {
                for y in Int(y1)...Int(y2) {
                    let x = x1 + (Double(y) - y1) * diffX / diffY
                    let z = z1 + (Double(y) - y1) * diffZ / diffY
                    createBox(x, Double(y), z, r: r, g: g, b: b, alpha: alpha)
                }
            } else {
                for y in stride(from: Int(y1), through: Int(y2 + 1), by: -1) {
                    let x = x1 + (Double(y) - y1) * diffX / diffY
                    let z = z1 + (Double(y) - y1) * diffZ / diffY
                    createBox(x, Double(y), z, r: r, g: g, b: b, alpha: alpha)
                }
            }
        } else if abs(diffZ) == maxLength {
            if z2 > z1 {
                for z in Int(z1)...Int(z2) {
                    let x = x1 + (Double(z) - z1) * diffX / diffZ
                    let y = y1 + (Double(z) - z1) * diffY / diffZ
                    createBox(x, y, Double(z), r: r, g: g, b: b, alpha: alpha)
                }
            } else {
                for z in stride(from: Int(z1), through: Int(z2 + 1), by: -1) {
                    let x = x1 + (Double(z) - z1) * diffX / diffZ
                    let y = y1 + (Double(z) - z1) * diffY / diffZ
                    createBox(x, y, Double(z), r: r, g: g, b: b, alpha: alpha)
                }
            }
        }
    }


    func changeShape(_ shape: String) {
        self.shape = shape
    }

    func send() async throws {
        self.webSocketTask.resume()

        let date = Date()
        let dateFormatter = ISO8601DateFormatter()
        let dateString = dateFormatter.string(from: date)
        let dataDict = [
            "node": node,
            "animation": animation,
            "boxes": boxes,
            "sentence": sentence,
            "size": size,
            "shape": shape,
            "interval": buildInterval,
            "date": dateString
        ] as [String : Any]

        let jsonData = try JSONSerialization.data(withJSONObject: dataDict, options: [])
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to convert data to string")
            return
        }

        try await self.webSocketTask.send(.string(roomName))
        print("Joined room: \(roomName)")
        try await self.webSocketTask.send(.string(jsonString))
        print("Sent message: \(jsonString)")
    }

    func sendData() {
        Task.detached(priority: .userInitiated) {
            do {
                try await self.send()
            } catch {
                print("An error occurred: \(error)")
            }
        }
    }
}
