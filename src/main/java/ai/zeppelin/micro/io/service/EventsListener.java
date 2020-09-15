package ai.zeppelin.micro.io.service;

import ai.zeppelin.micro.io.event.Event;
import ai.zeppelin.micro.io.stream.EventsStream;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class EventsListener {
    @StreamListener(EventsStream.INPUT)
    public void receiveEvent(@Payload Event event) {
        log.info("Received Event: {}", event);
    }
}