import Foundation

@available(iOS 15.0, macOS 12.0, *)
class Turtle {
    var buildBox: BuildBox
    var x: Double
    var y: Double
    var z: Double
    var polarTheta: Double
    var polarPhi: Double
    var drawable: Bool
    var color: [Double]
    var size: Double

    init(buildBox: BuildBox) {
        self.buildBox = buildBox
        self.x = 0
        self.y = 0
        self.z = 0
        self.polarTheta = 90
        self.polarPhi = 0
        self.drawable = true
        self.color = [0, 0, 0, 1]
        self.size = 1
    }

    func forward(_ length: Double) {
        let radiansTheta = polarTheta * Double.pi / 180.0
        let radiansPhi = polarPhi * Double.pi / 180.0

        let z = self.z + length * sin(radiansTheta) * cos(radiansPhi)
        let x = self.x + length * sin(radiansTheta) * sin(radiansPhi)
        let y = self.y + length * cos(radiansTheta)
        let r: Double = self.color[0]
        let g: Double = self.color[1]
        let b: Double = self.color[2]
        let alpha: Double = self.color[3]

        let roundedX = round(x * 1000) / 1000
        let roundedY = round(y * 1000) / 1000
        let roundedZ = round(z * 1000) / 1000

        if drawable {
            buildBox.drawLine(self.x, self.y, self.z, roundedX, roundedY, roundedZ, r: r, g: g, b: b, alpha: alpha)
        }

        self.x = roundedX
        self.y = roundedY
        self.z = roundedZ
    }

    func backward(_ length: Double) {
        forward(-length)
    }

    func up(_ degree: Double) {
        polarTheta -= degree
    }

    func down(_ degree: Double) {
        polarTheta += degree
    }

    func right(_ degree: Double) {
        polarPhi -= degree
    }

    func left(_ degree: Double) {
        polarPhi += degree
    }

    func setColor(_ r: Double, _ g: Double, _ b: Double, _ alpha: Double) {
        color = [r, g, b, alpha]
    }

    func penDown() {
        drawable = true
    }

    func penUp() {
        drawable = false
    }

    func setPos(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }

    func reset() {
        x = 0
        y = 0
        z = 0
        polarTheta = 90
        polarPhi = 0
        drawable = true
        color = [0, 0, 0, 1]
        size = 1
    }
}

// BuildBoxクラスの定義は提供されていないため省略
