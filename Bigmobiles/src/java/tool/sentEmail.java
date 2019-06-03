/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package tool;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Tuan
 */
public class sentEmail {
    public static void send(String to, String sub,
            String msg) {
     

        final String user = "ngocthang22298@gmail.com"; //tự nhập email, pass của admin vô
        final String pass = "01662644936";
        Properties props = new Properties();

       
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        /* Pass Properties object(props) and Authenticator object   
         for authentication to Session instance 
         */
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {

            /* Create an instance of MimeMessage, 
             it accept MIME types and headers 
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setText(msg);

            /* Transport class is used to deliver the message to the recipients */
            Transport.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
