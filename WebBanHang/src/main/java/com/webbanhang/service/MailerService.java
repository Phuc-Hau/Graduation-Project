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
		String su="M?? x??c minh b???n c???n d??ng ????? truy c???p v??o T??i kho???n v???i gmail: "+email
				+ " M?? x??c minh l??: "+capchas+" N???u b???n kh??ng y??u c???u m?? n??y th?? c?? th??? l?? ai ???? ??ang t??m c??ch truy c???p v??o T??i kho???n c???a b???n. "
				+ "Kh??ng chuy???n ti???p ho???c cung c???p m?? n??y cho b???t k??? ai."
				+ "Tr??n tr???ng!";;
		this.send(new MailInfo(email, "L???y l???i m???t kh???u", su));
	}
	
	@Override
	public void sendSignUp(String email,String capchas) throws MessagingException {
		// TODO Auto-generated method stub
		String su="M?? x??c minh b???n c???n d??ng ????? truy c???p t???o T??i kho???n v???i gmail: "+email
				+ " M?? x??c minh l??: "+capchas+" N???u b???n kh??ng y??u c???u m?? n??y th?? c?? th??? l?? ai ???? ??ang t??m c??ch truy c???p v??o T??i kho???n c???a b???n. "
				+ "Kh??ng chuy???n ti???p ho???c cung c???p m?? n??y cho b???t k??? ai."
				+ "Tr??n tr???ng!";;
		this.send(new MailInfo(email, "L???y l???i m???t kh???u", su));
	}

}
