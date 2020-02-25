package net.codingblocks.enrichment.entities

import com.google.gson.Gson
import org.apache.kafka.common.serialization.Deserializer
import org.apache.kafka.common.serialization.Serdes
import org.apache.kafka.common.serialization.Serializer
import java.nio.charset.StandardCharsets

class RawSighting(
        val sightingId: Int,
        val alienTypeId: Int,
        val latitude: Double,
        val longitude: Double
) {
    class Serde : Serdes.WrapperSerde<RawSighting>(object : Serializer<RawSighting> {
        private val gson = Gson()
        override fun configure(map: Map<String?, *>?, b: Boolean) {}
        override fun serialize(topic: String, data: RawSighting): ByteArray {
            return gson.toJson(data).toByteArray(StandardCharsets.UTF_8)
        }

        override fun close() {}
    }, object : Deserializer<RawSighting> {
        private val gson = Gson()
        override fun configure(configs: Map<String?, *>?, isKey: Boolean) {}
        override fun deserialize(topic: String, data: ByteArray): RawSighting {
            return gson.fromJson(String(data), RawSighting::class.java)
        }

        override fun close() {}
    })
}