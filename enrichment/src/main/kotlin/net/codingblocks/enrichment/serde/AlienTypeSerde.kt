package net.codingblocks.enrichment.serde

import com.google.gson.Gson
import net.codingblocks.enrichment.AlienType
import org.apache.kafka.common.serialization.Deserializer
import org.apache.kafka.common.serialization.Serdes.WrapperSerde
import org.apache.kafka.common.serialization.Serializer
import java.nio.charset.StandardCharsets;

class AlienTypeSerde : WrapperSerde<AlienType>(object : Serializer<AlienType> {
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