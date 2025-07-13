package com.yourcaryourway.poc.model;

public class Message {
    private String from;
    private String content;

    public Message() {
    }

    public Message(String from, String content) {
        this.from = from;
        this.content = content;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> df09051 (Feat: Add WebSocket chat PoC)
