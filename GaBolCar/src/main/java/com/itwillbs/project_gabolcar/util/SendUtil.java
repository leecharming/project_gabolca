package com.itwillbs.project_gabolcar.util;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

public class SendUtil {
	
	public static void sendMail(String email, String subject, String msg) {
		
		//메일 서버 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "gabolcar";
		String hostSMTPpwd = "rkqhfzk123!";
		
		//보내는 사람
		String fromEmail = "gabolcar@naver.com";
		String fromName = "GaBolCar";
		
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);
			
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true);
			mail.addTo(email);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	
	public static SingleMessageSentResponse sendMsg(String to,String msg) {
		final DefaultMessageService messageService;
		messageService = NurigoApp.INSTANCE.initialize("NCSSWYB7WLC6MPMX", "G8IIRAISGJ20DGUJ6WN2YGYWOZ9KMIGK", "https://api.coolsms.co.kr");
		Message message = new Message();
		message.setFrom("010-2658-2568");
        message.setTo(to);
        message.setText(msg);
        System.out.println("여긴???");
        SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return response;
		
		
	}
	

}
