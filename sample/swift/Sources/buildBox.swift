//
//  File.swift
//
//
//  Created by user_name on 2023/07/05.
//

import Foundation

@available(iOS 15.0, macOS 12.0, *)
class BuildBox {
    let url = URL(string: "wss://render-nodes-server.onrender.com")!
    let webSocketTask: URLSessionWebSocketTask
    var boxes = [[Double]]()
    var size: Double = 1.0

    init() {
        webSocketTask = URLSession.shared.webSocketTask(with: url)
    }

    func createBox(_ x: Double, _ y: Double, _  z: Double, _ r: Double, _ g: Double, _ b: Double) {
        let _x = floor(x)
        let _y = floor(y)
        let _z = floor(z)
        boxes.append([_x, _y, _z, r, g, b])
    }

    func removeBox(_ x: Double, _ y: Double, _ z: Double) {
        let _x = floor(x)
        let _y = floor(y)
        let _z = floor(z)
        for box in boxes {
            if (box[0] == _x && box[1] == _y && box[2] == _z) {
                boxes.remove(at: boxes.firstIndex(of: box)!)
            }
        }
    }

    func setSize(_ boxSize: Double) {
        size = boxSize
    }

    func clearBoxes() {
        boxes.removeAll()
        size = 1.0
    }

    func sendData(roomName: String) async throws {
        self.webSocketTask.resume()

        let date = Date()
        let dateFormatter = ISO8601DateFormatter()
        let dateString = dateFormatter.string(from: date)
        let dataDict = ["boxes": boxes, "size": size, "date": dateString] as [String : Any]

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
}

