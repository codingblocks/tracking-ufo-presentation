package net.codingblocks.enrichment

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class EnrichmentApplication

fun main(args: Array<String>) {
    runApplication<EnrichmentApplication>(*args)
    Processor().process()
}

