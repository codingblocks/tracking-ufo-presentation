package net.codingblocks.enrichment.entities

import com.google.gson.Gson
import org.apache.kafka.common.serialization.Deserializer
import org.apache.kafka.common.serialization.Serdes
import org.apache.kafka.common.serialization.Serializer
import java.nio.charset.StandardCharsets
import java.time.Instant

class EnrichedSighting(
        val alienType: String,
        val alienDescription: String,
        val image: String,
        val severity: Int,
        val svg: String,
        val sightingDate: Instant,
        val latitude: Double,
        val longitude: Double,
        val severityColor: String,
        val sightingCount: Int
) {
    class Serde : Serdes.WrapperSerde<EnrichedSighting>(object : Serializer<EnrichedSighting> {
        private val gson = Gson()
        override fun configure(map: Map<String?, *>?, b: Boolean) {}
        override fun serialize(topic: String, data: EnrichedSighting): ByteArray {
            return gson.toJson(data).toByteArray(StandardCharsets.UTF_8)
        }

        override fun close() {}
    }, object : Deserializer<EnrichedSighting> {
        private val gson = Gson()
        override fun configure(configs: Map<String?, *>?, isKey: Boolean) {}
        override fun deserialize(topic: String, data: ByteArray): EnrichedSighting {
            return gson.fromJson(String(data), EnrichedSighting::class.java)
        }

        override fun close() {}
    })
}