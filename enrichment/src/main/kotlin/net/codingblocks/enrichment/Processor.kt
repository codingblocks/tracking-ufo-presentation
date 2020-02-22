package net.codingblocks.enrichment

import org.apache.kafka.common.serialization.Serdes
import org.apache.kafka.streams.KafkaStreams
import org.apache.kafka.streams.StreamsBuilder
import org.apache.kafka.streams.StreamsConfig
import org.apache.kafka.streams.kstream.Consumed
import org.apache.kafka.streams.kstream.KTable
import org.apache.kafka.streams.kstream.Materialized
import org.apache.kafka.streams.kstream.Produced
import org.apache.kafka.streams.state.KeyValueStore
import java.time.Instant
import java.util.*




class RawSighting(
    val sightingId:Int,
    val alienTypeId:Int,
    val latitude:Double,
    val longitude:Double
)

class AlienTypes(
    val alienTypeId:Int,
    val type:String,
    val description:String,
    val image:String,
    val svg:String,
    val severity:Int
)

class ProcessedSighting(
    val alienPic:String,
    val alienType:String,
    val alienDescription:String,
    val image:String,
    val sightingDate: Instant,
    val svg:String,
    val latitude:Double,
    val longitude:Double,
    val severity:Int,
    val severityColor:String
)


class Processor {
    fun process() {
        val props = Properties()
        props[StreamsConfig.APPLICATION_ID_CONFIG] = "sightings-enricher"
        props[StreamsConfig.BOOTSTRAP_SERVERS_CONFIG] = "localhost:9092"
        props[StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG] = Serdes.String().javaClass
        props[StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG] = Serdes.String().javaClass

        val builder = StreamsBuilder()
        val sightings = builder.stream<String, RawSighting>("sightings", Consumed.with(Serdes.String(), RawSightingSerde()))

//        sightings.toStream().to("enriched-sightings", Produced.with(Serdes.String(), ProcessedSightingSerde()))

        sightings.foreach{
            k,v -> println(v.alienTypeId)
        }

        val streams = KafkaStreams(builder.build(), props)
       streams.start()
    }
}