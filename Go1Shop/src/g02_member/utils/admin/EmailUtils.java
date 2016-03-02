package g02_member.utils.admin;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;  

public class EmailUtils {
	      
	    //发送单个邮箱  
	    public void sendSingleMail(String emailAddress, String content, String title) {  
	        String [] emailAddresses = {emailAddress};  
	        sendGroupMail(emailAddresses, content, title);  
	    }  
	      
	    // 发送多个邮箱  
	    public void sendGroupMail(String[] emailAddresses, String content, String title) {  
	        String emailAddressFrom = "83EEIT83@gmail.com";//邮箱地址  
	        String emailServeiHost = "83EEIT83@gmail.com";//邮箱地址  
	        final String username = "83EEIT83@gmail.com";//用户名  
	        final String password ="eeit8383";//密码  
	        String nickname = "测试账号";//发件人昵称  
	        try {  
	            Properties props = System.getProperties();  
	            props.put("mail.smtp.host", emailServeiHost);  
	            props.put("mail.smtp.auth", "true");  
	            Session session = Session.getDefaultInstance(props,  
	                    new Authenticator() {  
	                public PasswordAuthentication getPasswordAuthentication() {  
	                    return new PasswordAuthentication(username,password);  
	                }  
	            });  
	              
	            MimeMessage mimeMessage = new MimeMessage(session);  
	              
	            mimeMessage.setFrom(new InternetAddress(MimeUtility.encodeText(nickname)+" <"+emailAddressFrom+">"));  
	            InternetAddress[] emailAddressTo = new InternetAddress[emailAddresses.length];  
	            for (int i = 0; i < emailAddresses.length; i++) {  
	                emailAddressTo[i] = new InternetAddress(emailAddresses[i]);  
	            }  
	              
	            mimeMessage.setSubject(title);  
	            mimeMessage.setRecipients(Message.RecipientType.TO, emailAddressTo);  
	            Multipart multipart = new MimeMultipart();  
	            MimeBodyPart mailContent = new MimeBodyPart();  
	            mailContent.setContent(content, "text/html;charset=utf-8");  
	            multipart.addBodyPart(mailContent);  
	            mimeMessage.setContent(multipart);  
	            mimeMessage.setSentDate(new Date());  
	            Transport.send(mimeMessage);  
	        } catch (AddressException e) {  
	            e.printStackTrace();  
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        } catch (MessagingException e) {  
	            e.printStackTrace();  
	        }  
	    }  
	      

}
