package com.webbanhang.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.webbanhang.jpa.model.MailInfo;
import com.webbanhang.utils.*;

@Service
public class MailerService implements MailerServiceUtils {

	@Autowired
	JavaMailSender sender;

	@Override
	public void send(MailInfo mail) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();

		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);
		helper.setReplyTo(mail.getFrom());

		String[] cc = mail.getCc();
		if (cc != null && cc.length > 0) {
			helper.setCc(cc);
		}

		String[] bcc = mail.getBcc();
		if (bcc != null && bcc.length > 0) {
			helper.setBcc(bcc);
		}

		String[] attachments = mail.getAttachments();
		if (attachments != null && attachments.length > 0) {
			for (String path : attachments) {
				File file = new File(path);
				helper.addAttachment(file.getName(), file);
			}
		}

		sender.send(message);

	}

	@Override
	public void send(String to, String subject, String body) throws MessagingException {
		// TODO Auto-generated method stub
		this.send(new MailInfo(to, subject, body));
	}

	List<MailInfo> list = new ArrayList<>();

	@Override
	public void queue(MailInfo mail) {
		// TODO Auto-generated method stub
		list.add(mail);
	}

	@Override
	public void queue(String to, String subject, String body) {
		// TODO Auto-generated method stub
		queue(new MailInfo(to, subject, body));
	}

	@Scheduled(fixedDelay = 3000)
	public void run() {
		while (!list.isEmpty()) {
			MailInfo mail = list.remove(0);
			try {
				this.send(mail);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void sendPassword(String email,String capchas) throws MessagingException {
		// TODO Auto-generated method stub
		String su="Mã xác minh bạn cần dùng để truy cập vào Tài khoản với gmail: "+email
				+ " Mã xác minh là: "+capchas+" Nếu bạn không yêu cầu mã này thì có thể là ai đó đang tìm cách truy cập vào Tài khoản của bạn. "
				+ "Không chuyển tiếp hoặc cung cấp mã này cho bất kỳ ai."
				+ "Trân trọng!";;
		this.send(new MailInfo(email, "Lấy lại mật khẩu", su));
	}
	
	@Override
	public void sendSignUp(String email,String capchas) throws MessagingException {
		// TODO Auto-generated method stub
		String su="Mã xác minh bạn cần dùng để truy cập tạo Tài khoản với gmail: "+email
				+ " Mã xác minh là: "+capchas+" Nếu bạn không yêu cầu mã này thì có thể là ai đó đang tìm cách truy cập vào Tài khoản của bạn. "
				+ "Không chuyển tiếp hoặc cung cấp mã này cho bất kỳ ai."
				+ "Trân trọng!";;
		this.send(new MailInfo(email, "Lấy lại mật khẩu", su));
	}

}
