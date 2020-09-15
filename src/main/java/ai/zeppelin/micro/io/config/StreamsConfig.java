package ai.zeppelin.micro.io.config;


import ai.zeppelin.micro.io.stream.EventsStream;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.integration.config.EnableIntegration;

@EnableBinding(EventsStream.class)
@EnableIntegration
public class StreamsConfig {

}