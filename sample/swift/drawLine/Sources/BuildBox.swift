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
    var buildInterval = 0.01

    init(_ roomName: String) {
        self.roomName = roomName
        webSocketTask = URLSession.shared.webSocketTask(with: url)
    }

    func setNode(_ x: Double, _ y: Double, _  z: Double, pitch: Double = 0, yaw: Double = 0, roll: Double = 0) {
        let float_x = floor(x)
        let float_y = floor(y)
        let float_z = floor(z)
        node = [float_x, float_y, float_z, pitch, yaw, roll]
    }

    func animationNode(_ x: Double, _ y: Double, _  z: Double, pitch: Double = 0, yaw: Double = 0, roll: Double = 0, scale: Double = 1, interval: Double = 10) {
        let float_x = floor(x)
        let float_y = floor(y)
        let float_z = floor(z)
        animation = [float_x, float_y, float_z, pitch, yaw, roll, scale, interval]
    }

    func createBox(_ x: Double, _ y: Double, _  z: Double, r: Double = 1, g: Double = 1, b: Double = 1, alpha: Double = 1) {
        let float_x = floor(x)
        let float_y = floor(y)
        let float_z = floor(z)
        boxes.append([float_x, float_y, float_z, r, g, b, alpha])
    }

    func removeBox(_ x: Double, _ y: Double, _ z: Double) {
        let float_x = floor(x)
        let float_y = floor(y)
        let float_z = floor(z)
        for box in boxes {
            if (box[0] == float_x && box[1] == float_y && box[2] == float_z) {
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
    }

    func writeSentence(_ string_sentence: String, _ x: Double, _ y: Double, _  z: Double, r: Double = 0, g: Double = 0, b: Double = 0, alpha: Double = 1) {
        let string_x = String(floor(x))
        let string_y = String(floor(y))
        let string_z = String(floor(z))
        let string_r = String(r)
        let string_g = String(g)
        let string_b = String(b)
        let string_alpha = String(alpha)
        sentence = [string_sentence, string_x, string_y, string_z, string_r, string_g, string_b, string_alpha]
    }

    func drawLine(_ x1: Double, _ y1: Double, _ z1: Double, _ x2: Double, _ y2: Double, _ z2: Double, r: Double = 1, g: Double = 1, b: Double = 1, alpha: Double = 1) {
        let x1: Double = floor(x1)
        let y1: Double = floor(y1)
        let z1: Double = floor(z1)
        let x2: Double = floor(x2)
        let y2: Double = floor(y2)
        let z2: Double = floor(z2)
        let diff_x = x2 - x1
        let diff_y = y2 - y1
        let diff_z = z2 - z1

        if diff_x == 0 && diff_y == 0 && diff_z == 0 {
            return
        }

        if diff_x == max(diff_x, diff_y, diff_z) {
            for x in Int(x1)...Int(x2) {
                let y = y1 + (Double(x) - x1) * diff_y / diff_x
                let z = z1 + (Double(x) - x1) * diff_z / diff_x
                self.createBox(Double(x), y, z, r: r, g: g, b: b, alpha: alpha)
            }
        } else if diff_y == max(diff_x, diff_y, diff_z) {
            for y in Int(y1)...Int(y2) {
                let x = x1 + (Double(y) - y1) * diff_x / diff_y
                let z = z1 + (Double(y) - y1) * diff_z / diff_y
                self.createBox(x, Double(y), z, r: r, g: g, b: b, alpha: alpha)
            }
        } else if diff_z == max(diff_x, diff_y, diff_z) {
            for z in Int(z1)...Int(z2) {
                let x = x1 + (Double(z) - z1) * diff_x / diff_z
                let y = y1 + (Double(z) - z1) * diff_y / diff_z
                self.createBox(x, y, Double(z), r: r, g: g, b: b, alpha: alpha)
            }
        }
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
