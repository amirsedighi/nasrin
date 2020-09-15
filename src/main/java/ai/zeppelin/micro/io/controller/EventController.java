package ai.zeppelin.micro.io.controller;

import ai.zeppelin.micro.io.event.Event;
import ai.zeppelin.micro.io.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EventController {

    @Autowired
    EventService eventService;

    @GetMapping("/event")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public void event(@RequestParam("payload") String payload) {
        Event event = Event.builder()
                .message(payload)
                .timestamp(System.currentTimeMillis())
                .build();
        eventService.sendGreeting(event);
    }
}