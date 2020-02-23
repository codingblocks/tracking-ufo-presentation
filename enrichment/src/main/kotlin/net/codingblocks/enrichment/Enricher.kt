package net.codingblocks.enrichment

import net.codingblocks.enrichment.entities.EnrichedSighting
import net.codingblocks.enrichment.entities.RawSighting
import net.codingblocks.enrichment.entities.AlienType
import org.apache.kafka.common.serialization.Serdes
import org.apache.kafka.streams.KafkaStreams
import org.apache.kafka.streams.StreamsBuilder
import org.apache.kafka.streams.StreamsConfig
import org.apache.kafka.streams.kstream.*
import java.time.Instant
import java.util.*

class Enricher {
    fun enrich() {
        val props = Properties()
        props[StreamsConfig.APPLICATION_ID_CONFIG] = "sightings-enricher"
        props[StreamsConfig.BOOTSTRAP_SERVERS_CONFIG] = "localhost:9092"
        props[StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG] = Serdes.String().javaClass
        props[StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG] = Serdes.String().javaClass

        val builder = StreamsBuilder()
        val sightings = builder.stream<String, RawSighting>("sightings", Consumed.with(Serdes.String(), RawSighting.Serde()))
        val alienTypes = builder.globalTable<String, AlienType>("alien-types", Consumed.with(Serdes.String(), AlienType.Serde()))

        sightings
                .join(
                        alienTypes,
                        KeyValueMapper<String, RawSighting, String> { _, sighting -> sighting.alienTypeId.toString() },
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
                                    count(sighting.alienTypeId)
                            )
                        }
                ).to("enriched-sightings", Produced.with(Serdes.String(), EnrichedSighting.Serde()))

        val streams = KafkaStreams(builder.build(), props)
        streams.start()
    }

    private val severityColors = listOf("#33cc00", "#cccc00", "#cc8100", "#cc1400")
    private fun getColor(severity: Int) = severityColors[severity]

    // Note: this is not a good way of counting sightings, it's just to demonstrate the concept
    // Really, you need to use a true persistent layer here
    private val counts = HashMap<Int, Int>()

    private fun count(alienTypeId: Int): Int {
        counts[alienTypeId] = counts.getOrDefault(alienTypeId, 0) + 1
        return counts[alienTypeId]!!
    }
}