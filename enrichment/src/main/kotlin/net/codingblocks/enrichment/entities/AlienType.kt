package net.codingblocks.enrichment.entities

import com.google.gson.Gson
import org.apache.kafka.common.serialization.Deserializer
import org.apache.kafka.common.serialization.Serdes
import org.apache.kafka.common.serialization.Serializer
import java.nio.charset.StandardCharsets

class AlienType(
    val alienTypeId: Int,
    val type: String,
    val description: String,
    val image: String,
    val svg: String,
    val severity: Int
) {
    class Serde : Serdes.WrapperSerde<AlienType>(object : Serializer<AlienType> {
        private val gson = Gson()
        override fun configure(map: Map<String?, *>?, b: Boolean) {}
        override fun serialize(topic: String, data: AlienType): ByteArray {
            return gson.toJson(data).toByteArray(StandardCharsets.UTF_8)
        }

        override fun close() {}
    }, object : Deserializer<AlienType> {
        private val gson = Gson()
        override fun configure(configs: Map<String?, *>?, isKey: Boolean) {}
        override fun deserialize(topic: String, data: ByteArray): AlienType {
            return gson.fromJson(String(data), AlienType::class.java)
        }
        override fun close() {}
    })
}