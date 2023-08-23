import io.ktor.client.*
import io.ktor.client.features.websocket.*
import io.ktor.client.request.*
import io.ktor.http.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.runBlocking
import kotlinx.serialization.Serializable
import kotlinx.serialization.encodeToString
import kotlinx.serialization.json.Json
import kotlin.math.floor

@Serializable
data class DataToSend(
    val globalAnimation: List<Int>,
    val node: List<Int>,
    val animation: List<Int>,
    val boxes: List<List<Number>>,
    val sentence: List<Any>,
    val lights: List<List<Number>>,
    val commands: List<String>,
    val size: Int,
    val shape: String,
    val interval: Float,
    val isMetallic: Int,
    val roughness: Float,
    val date: String
)

class BuildBox(private val roomName: String) {
    var globalAnimation = listOf(0, 0, 0, 0, 0, 0, 1, 0)
    var node = listOf(0, 0, 0, 0, 0, 0)
    var animation = listOf(0, 0, 0, 0, 0, 0, 1, 0)
    var boxes = mutableListOf<List<Number>>()
    var sentence = mutableListOf<Any>()
    var lights = mutableListOf<List<Number>>()
    var commands = mutableListOf<String>()
    var size = 1f
    var shape = "box"
    var isMetallic = 0
    var roughness = 0.5f
    var buildInterval = 0.01f
    private val client = HttpClient {
        install(WebSockets)
    }

    fun animateGlobal(x: Float, y: Float, z: Float, pitch: Float = 0f, yaw: Float = 0f, roll: Float = 0f, scale: Float = 1f, interval: Int = 10) {
        clearData()
        globalAnimation = listOf(floor(x).toInt(), floor(y).toInt(), floor(z).toInt(), floor(pitch).toInt(), floor(yaw).toInt(), floor(roll).toInt(), scale.toInt(), interval)
    }

    fun animateNode(x: Float, y: Float, z: Float, pitch: Float = 0f, yaw: Float = 0f, roll: Float = 0f, scale: Float = 1f, interval: Int = 10) {
        node = listOf(floor(x).toInt(), floor(y).toInt(), floor(z).toInt(), floor(pitch).toInt(), floor(yaw).toInt(), floor(roll).toInt(), scale.toInt(), interval)
    }

    fun setAnimation(x: Float, y: Float, z: Float, pitch: Float = 0f, yaw: Float = 0f, roll: Float = 0f, scale: Float = 1f, interval: Int = 10) {
        animation = listOf(floor(x).toInt(), floor(y).toInt(), floor(z).toInt(), floor(pitch).toInt(), floor(yaw).toInt(), floor(roll).toInt(), scale.toInt(), interval)
    }

    fun addBox(x: Number, y: Number, z: Number) {
        boxes.add(listOf(x, y, z))
    }

    fun addSentence(item: Any) {
        sentence.add(item)
    }

    fun addLight(x: Number, y: Number, z: Number) {
        lights.add(listOf(x, y, z))
    }

    fun addCommand(command: String) {
        commands.add(command)
    }

    fun setSize(s: Float) {
        size = s
    }

    fun setShape(s: String) {
        shape = s
    }

    fun setIsMetallic(value: Int) {
        isMetallic = value
    }

    fun setRoughness(r: Float) {
        roughness = r
    }

    fun setBuildInterval(interval: Float) {
        buildInterval = interval
    }

    fun clearData() {
        globalAnimation = listOf(0, 0, 0, 0, 0, 0, 1, 0)
        node = listOf(0, 0, 0, 0, 0, 0)
        animation = listOf(0, 0, 0, 0, 0, 0, 1, 0)
        boxes.clear()
        sentence.clear()
        lights.clear()
        commands.clear()
        size = 1
        shape = "box"
        isMetallic = 0
        roughness = 0.5f
        buildInterval = 0.01f
    }

    fun sendData() {
        runBlocking {
            val data = DataToSend(
                globalAnimation = globalAnimation,
                node = node,
                animation = animation,
                boxes = boxes,
                sentence = sentence,
                lights = lights,
                commands = commands,
                size = size,
                shape = shape,
                interval = buildInterval,
                isMetallic = isMetallic,
                roughness = roughness,
                date = LocalDateTime.now().toString()
            )

            val jsonString = Json.encodeToString(data)

            client.webSocket(host = "websocket.voxelamming.com", port = 443, path = "/") {
                launch(Dispatchers.IO) {
                    try {
                        send(Frame.Text(jsonString))
                        println("Sent data to server")
                    } catch (e: Exception) {
                        println("Error sending data: ${e.message}")
                    }
                }
            }
        }
    }
}

fun main() {
    val box = BuildBox("sampleRoom")
    box.sendData()
}
