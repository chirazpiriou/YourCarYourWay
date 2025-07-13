package com.yourcaryourway.poc.controller;

import com.yourcaryourway.poc.model.Message;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class ChatController {

<<<<<<< HEAD
    @MessageMapping("/chat") // reçoit depuis /app/chat
    @SendTo("/topic/messages") // envoie à tous ceux connectés à /topic/messages
    public Message send(Message message) throws Exception {
        Thread.sleep(500); // simulate delay
        return new Message(message.getFrom(), message.getContent());
    }
}
=======
    @MessageMapping("/chat") 
    @SendTo("/topic/messages") 
    public Message send(Message message) throws Exception {
        Thread.sleep(500); 
        return new Message(message.getFrom(), message.getContent());
    }
}
>>>>>>> df09051 (Feat: Add WebSocket chat PoC)
