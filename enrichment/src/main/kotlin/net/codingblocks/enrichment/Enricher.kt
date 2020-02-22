package net.codingblocks.enrichment

import net.codingblocks.enrichment.serde.AlienTypeSerde
import net.codingblocks.enrichment.serde.EnrichedSightingSerde
import net.codingblocks.enrichment.serde.RawSightingSerde
import org.apache.kafka.common.serialization.Serdes
import org.apache.kafka.streams.KafkaStreams
import org.apache.kafka.streams.StreamsBuilder
import org.apache.kafka.streams.StreamsConfig
import org.apache.kafka.streams.kstream.Consumed
import org.apache.kafka.streams.kstream.KeyValueMapper
import org.apache.kafka.streams.kstream.Produced
import org.apache.kafka.streams.kstream.ValueJoiner
import java.time.Instant
import java.util.*

class RawSighting(
        val sightingId: Int,
        val alienTypeId: Int,
        val latitude: Double,
        val longitude: Double
)

class AlienType(
        val alienTypeId: Int,
        val type: String,
        val description: String,
        val image: String,
        val svg: String,
        val severity: Int
)

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
)

class Enricher {
    fun enrich() {
        val props = Properties()
        props[StreamsConfig.APPLICATION_ID_CONFIG] = "sightings-enricher"
        props[StreamsConfig.BOOTSTRAP_SERVERS_CONFIG] = "localhost:9092"
        props[StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG] = Serdes.String().javaClass
        props[StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG] = Serdes.String().javaClass

        val builder = StreamsBuilder()
        val sightings = builder.stream<String, RawSighting>("sightings", Consumed.with(Serdes.String(), RawSightingSerde()))
        val alienTypes = builder.globalTable<String, AlienType>("alien-types", Consumed.with(Serdes.String(), AlienTypeSerde()))

        sightings.join(
                alienTypes,
                KeyValueMapper<String, RawSighting, String>{ _, sighting -> sighting.alienTypeId.toString() },
                ValueJoiner<RawSighting, AlienType, EnrichedSighting> { sighting, alienType ->
                    EnrichedSighting(
                        alienType.type,
                        alienType.description,
                        alienType.image,
                        alienType.severity,
                        alienType.svg,
                        Instant.now(),
                        sighting.latitude,
                        sighting.longitude,
                        getColor(alienType.severity),
                        count(alienType.alienTypeId)
                    )
                }
        ).to("enriched-sightings", Produced.with(Serdes.String(), EnrichedSightingSerde() ))


    val streams = KafkaStreams(builder.build(), props)
    streams.start()
}

private val severityColors = listOf("#33cc00", "#cccc00", "#cc8100", "#cc1400")
private fun getColor(severity: Int) = severityColors[severity]

// Note: this is not a good way of counting sightings, it's just to demonstrate the concept
// Really, you need to use a true persistant layer here
private val counts = HashMap<Int, Int>()

private fun count(alienTypeId: Int): Int {
    counts[alienTypeId] = counts.getOrDefault(alienTypeId, 0) + 1
    return counts[alienTypeId]!!
}
}