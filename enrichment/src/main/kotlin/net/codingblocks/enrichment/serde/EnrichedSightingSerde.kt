package net.codingblocks.enrichment.serde

import com.google.gson.Gson
import net.codingblocks.enrichment.EnrichedSighting
import org.apache.kafka.common.serialization.Deserializer
import org.apache.kafka.common.serialization.Serdes.WrapperSerde
import org.apache.kafka.common.serialization.Serializer
import java.nio.charset.StandardCharsets;

class EnrichedSightingSerde : WrapperSerde<EnrichedSighting>(object : Serializer<EnrichedSighting> {
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