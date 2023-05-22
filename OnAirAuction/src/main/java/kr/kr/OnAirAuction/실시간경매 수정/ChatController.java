package kr.kh.onairauction.controller;


import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.kh.onairauction.service.AuctionService;


@Controller 
@ServerEndpoint(value="/echo.do/{chattingChannel}/{userId}")
public class ChatController {
    
   
    private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
    private static final Map<Integer, Map<String, Session>> roomMap = new HashMap<Integer, Map<String, Session>>();

    public ChatController() {
 
        System.out.println("웹소켓 생성");
    }
    
    @OnOpen //스크립트에서 소켓을 열면 자동으로 실행이 됨 //웹에서 해당이벤트가 발생하면 실행시키는 구조
    public void onOpen(Session session, @PathParam("userId") String id, @PathParam("chattingChannel") String num) {
    	
        logger.info("Participate Room:"+ num +", "+ "Open session id:" + id);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("대화방에 연결되었습니다.");
        }catch (Exception e) {
            
            System.out.println(e.getMessage());
        }
        
        Integer roomNum = Integer.valueOf(num);
    	Map<String, Session> roomMemberMap = roomMap.get(roomNum);
    	if(roomMemberMap == null)
    		roomMemberMap = new HashMap<String, Session>();
    	roomMemberMap.put(id, session);
    	roomMap.put(roomNum, roomMemberMap);
        
    }
    
  
    private void sendAllSessionToMessage(Session self, String sender, String message, String room) {
    	
        try {
        	Integer roomNum = Integer.valueOf(room);
        	System.out.println(roomNum);
        	Map<String, Session> idSession = roomMap.get(roomNum);
        	System.out.println(idSession);
        	Collection<Session> SessionValue = idSession.values();
        	for( Session session : SessionValue) {
        	
        		if(!self.getId().equals(session.getId())) {
        			session.getBasicRemote().sendText(sender+" : "+message);
        		}
        		
        	}
            /*for(Session session : WebSocketChat.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(sender+" : "+message);
                }
            }*/
        }catch (Exception e) {
        	
            System.out.println(e.getMessage());
        }
    }
    
  
    @OnMessage //스크립트에서 소켓으로 메시지를 보내면 자동으로 실행
    public void onMessage(String message,Session session) {
    	
    	String room = message.split(",")[2];
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	System.out.println(sender);
    	
        logger.info("Message From "+sender + ": "+message);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("<나> : "+message);
            
        }catch (Exception e) {
            e.printStackTrace();
            //System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message, room);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        //sessionList.remove(session);
        Collection<Map<String, Session>> s = roomMap.values();
    }
}