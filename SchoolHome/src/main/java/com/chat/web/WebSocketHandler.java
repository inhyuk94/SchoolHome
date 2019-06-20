package com.chat.web;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import java.util.*;


public class WebSocketHandler extends TextWebSocketHandler{
	//접속한 사람 저장
	private Map<String,WebSocketSession> users=new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId()+" 님이 퇴장하였습니다.");
		users.remove(session.getId());
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId()+" 님이 입장하였습니다.");
		users.put(session.getId(),session);
	}

	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		System.out.println(message.toString());
		for(WebSocketSession ws:users.values()){
			ws.sendMessage(message);
		}
	}
}
