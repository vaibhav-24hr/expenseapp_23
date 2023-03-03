package com.expenses.project.service;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import org.springframework.stereotype.Service;



@Service
public class EmailService {
	public  void sendEmailForForgetPassword(String email,String otp) {

		final String from = "vaibhavsocial1111@gmail.com";// from address
		final String appPassword = "bithwpwpclnlcueg"; // tejas123

		Properties prop = System.getProperties();

		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.ssl.enable", "false");

		Session session = Session.getInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(from, appPassword);
			}
		});	

		session.setDebug(true);

		try {
			MimeMessage message = new MimeMessage(session);

			message.setFrom(from);
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			message.setSubject("OTP For Update Password");
			message.setContent("Please use this OTP for Update Password.... ==> "+ otp, "text/html");

			Transport.send(message);

			System.out.println("email sent.............");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("something went wrong...........");
		}
	}
}
