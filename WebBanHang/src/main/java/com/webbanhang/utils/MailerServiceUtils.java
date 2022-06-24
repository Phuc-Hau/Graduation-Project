package com.webbanhang.utils;

import javax.mail.MessagingException;

import com.webbanhang.jpa.model.MailInfo;

public interface MailerServiceUtils {
	
	void send(MailInfo mailInfo) throws MessagingException;
	
	void send(String to, String subject, String body) throws MessagingException;
	
	void queue(MailInfo mail);
	
	void queue(String to, String subject, String body);
	
	void sendPassword(String email,String capchas)throws MessagingException;
	
	public void sendSignUp(String email,String capchas) throws MessagingException;
}
