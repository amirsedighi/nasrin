package ai.zeppelin.micro.io.service;

import ai.zeppelin.micro.io.event.Event;
import ai.zeppelin.micro.io.stream.EventsStream;
import lombok.extern.slf4j.Slf4j;
import org.springframework.integration.support.MessageBuilder;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.MessageHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.MimeTypeUtils;

@Service
@Slf4j
public class EventService {
    private final EventsStream eventsStream;

    public EventService(EventsStream eventsStream) {
        this.eventsStream = eventsStream;
    }

    public void sendGreeting(final Event event) {
        log.info("Sending Event {}", event);
        MessageChannel messageChannel = eventsStream.outboundEvents();
        messageChannel.send(MessageBuilder.withPayload(event).setHeader(MessageHeaders.CONTENT_TYPE, MimeTypeUtils.APPLICATION_JSON).build());
    }
}