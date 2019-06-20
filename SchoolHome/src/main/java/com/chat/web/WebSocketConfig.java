package com.chat.web;

import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.config.annotation.*;

public class WebSocketConfig implements WebSocketConfigurer{

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry reg) {
		reg.addHandler(chatHandler(), "/chat-ws"); 
	}
	
	@Bean
	public WebSocketHandler chatHandler(){
		return new WebSocketHandler();
	}

}
