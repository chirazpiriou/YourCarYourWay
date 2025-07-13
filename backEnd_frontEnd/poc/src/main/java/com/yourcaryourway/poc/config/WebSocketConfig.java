package com.yourcaryourway.poc.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.*;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
<<<<<<< HEAD
        config.enableSimpleBroker("/topic"); // messages envoyés aux abonnés
        config.setApplicationDestinationPrefixes("/app"); // messages envoyés au serveur
=======
        config.enableSimpleBroker("/topic"); 
        config.setApplicationDestinationPrefixes("/app"); 
>>>>>>> df09051 (Feat: Add WebSocket chat PoC)
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/chat-websocket").setAllowedOriginPatterns("*").withSockJS();
    }
}
