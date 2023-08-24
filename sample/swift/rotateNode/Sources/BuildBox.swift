import Foundation

@available(iOS 15.0, macOS 12.0, *)
class BuildBox {
    let url = URL(string: "wss://websocket.voxelamming.com")!
    let webSocketTask: URLSessionWebSocketTask
    var roomName = ""
    var globalAnimation: [Double] = [0, 0, 0, 0, 0, 0, 1, 0]
    var node: [Double] = [0, 0, 0, 0, 0, 0, 0]
    var animation: [Double] = [0, 0, 0, 0, 0, 0, 1, 0]
    var boxes = [[Double]]()
    var sentence = [String]()
    var lights = [[Double]]()
    var commands = [String]()
    var size: Double = 1.0
    var shape: String = "box"
    var isMetallic: Int = 0
    var roughness: Double = 0.5
    var isAllowedFloat: Int = 0
    var buildInterval = 0.01

    init(roomName: String) {
        self.roomName = roomName
        webSocketTask = URLSession.shared.webSocketTask(with: url)
    }

    func animateGlobal(_ x: Double, _ y: Double, _  z: Double, pitch: Double = 0, yaw: Double = 0, roll: Double = 0, scale: Double = 1, interval: Double = 10) {
        let roundNumList = roundNumbers(numList: [x, y, z])
        let roundX = roundNumList[0]
        let roundY = roundNumList[1]
        let roundZ = roundNumList[2]
        globalAnimation = [roundX, roundY, roundZ, pitch, yaw, roll, scale, interval]
    }

    func translate(_ x: Double, _ y: Double, _  z: Double, pitch: Double = 0, yaw: Double = 0, roll: Double = 0) {
        let roundNumList = roundNumbers(numList: [x, y, z])
        let roundX = roundNumList[0]
        let roundY = roundNumList[1]
        let roundZ = roundNumList[2]
        node = [roundX, roundY, roundZ, pitch, yaw, roll]
    }

    func animate(_ x: Double, _ y: Double, _  z: Double, pitch: Double = 0, yaw: Double = 0, roll: Double = 0, scale: Double = 1, interval: Double = 10) {
        let roundNumList = roundNumbers(numList: [x, y, z])
        let roundX = roundNumList[0]
        let roundY = roundNumList[1]
        let roundZ = roundNumList[2]
        animation = [roundX, roundY, roundZ, pitch, yaw, roll, scale, interval]
    }

    func createBox(_ x: Double, _ y: Double, _  z: Double, r: Double = 1, g: Double = 1, b: Double = 1, alpha: Double = 1) {
        let roundNumList = roundNumbers(numList: [x, y, z])
        let roundX = roundNumList[0]
        let roundY = roundNumList[1]
        let roundZ = roundNumList[2]
        // 重ねて置くことを防止するために、同じ座標の箱があれば削除する
        removeBox(roundX, roundY, roundZ)
        boxes.append([roundX, roundY, roundZ, r, g, b, alpha])
    }

    func removeBox(_ x: Double, _ y: Double, _ z: Double) {
        let roundNumList = roundNumbers(numList: [x, y, z])
        let roundX = roundNumList[0]
        let roundY = roundNumList[1]
        let roundZ = roundNumList[2]
        for box in boxes {
            if (box[0] == roundX && box[1] == roundY && box[2] == roundZ) {
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
        globalAnimation = [0, 0, 0, 0, 0, 0, 1, 0]
        node = [0, 0, 0, 0, 0, 0, 0]
        animation = [0, 0, 0, 0, 0, 0, 1, 0]
        boxes = [[Double]]()
        boxes.removeAll()
        sentence.removeAll()
        lights.removeAll()
        commands.removeAll()
        size = 1.0
        isMetallic = 0
        roughness = 0.5
        isAllowedFloat = 0
        shape = "box"
    }

    func writeSentence(_ string_sentence: String, _ x: Double, _ y: Double, _  z: Double, r: Double = 0, g: Double = 0, b: Double = 0, alpha: Double = 1) {
        let roundNumList = roundNumbers(numList: [x, y, z])
        let roundX = roundNumList[0]
        let roundY = roundNumList[1]
        let roundZ = roundNumList[2]
        let stringX = String(roundX)
        let stringY = String(roundY)
        let stringZ = String(roundZ)
        let stringR = String(r)
        let stringG = String(g)
        let stringB = String(b)
        let stringAlpha = String(alpha)
        sentence = [string_sentence, stringX, stringY, stringZ, stringR, stringG, stringB, stringAlpha]
    }

    func setLight(_ x: Double, _ y: Double, _  z: Double, r: Double = 0, g: Double = 0, b: Double = 0, alpha: Double = 1, intensity: Double = 1000, interval: Double = 1, lightType: String = "point") {
        let roundNumList = roundNumbers(numList: [x, y, z])
        let roundX = roundNumList[0]
        let roundY = roundNumList[1]
        let roundZ = roundNumList[2]
        var doubleLightType: Double

        if lightType == "point" {
            doubleLightType = 1
        } else if lightType == "spot" {
            doubleLightType = 2
        } else if lightType == "directional" {
            doubleLightType = 3
        } else {
            doubleLightType = 1
        }
        lights.append([roundX, roundY, roundZ, r, g, b, alpha, intensity, interval, doubleLightType])
    }

    func setCommand(_ command: String) {
        commands.append(command)

        if command == "float" {
            isAllowedFloat = 1
        }
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

    func changeMaterial(isMetallic: Bool = false, roughness: Double = 0.5) {
        self.isMetallic = isMetallic ? 1 : 0
        self.roughness = roughness
    }

    func send() async throws {
        self.webSocketTask.resume()

        let date = Date()
        let dateFormatter = ISO8601DateFormatter()
        let dateString = dateFormatter.string(from: date)
        let dataDict = [
            "globalAnimation": globalAnimation,
            "node": node,
            "animation": animation,
            "boxes": boxes,
            "sentence": sentence,
            "lights": lights,
            "commands": commands,
            "size": size,
            "shape": shape,
            "isMetallic": isMetallic,
            "roughness": roughness,
            "interval": buildInterval,
            "isAllowedFloat": isAllowedFloat,
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

    func roundNumbers(numList: [Double]) -> [Double] {
        if isAllowedFloat == 1 {
            return numList.map { round($0 * 100) / 100 }
        } else {
            return numList.map { floor($0) }
        }
    }
}
