package com.yourcaryourway.poc.controller;

import com.yourcaryourway.poc.model.Message;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class ChatController {

    @MessageMapping("/chat")
    @SendTo("/topic/messages")
    public Message send(Message message) throws Exception {
        Thread.sleep(500);
        return new Message(message.getFrom(), message.getContent());
    }
}
