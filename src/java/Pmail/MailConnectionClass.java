package Pmail;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class MailConnectionClass {

    public synchronized static boolean sendMail(String[] to, String subject, String text) {

        String host = "smtp.gmail.com";
        String port = "587";
        String starttls = "true";
        String auth = "true";
        String user = "securemailingserver@gmail.com";
        String pass = "cqfiowobgsbawcbm";
        //Securemail@28101999

        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", starttls);
        props.put("mail.smtp.ssl.trust", host);
        props.put("mail.smtp.user", user);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", auth);

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {

            message.setFrom(new InternetAddress(user));
            InternetAddress[] toAddress = new InternetAddress[to.length];
            for (int i = 0; i < to.length; i++) {
                toAddress[i] = new InternetAddress(to[i]);
            }
            for (InternetAddress toAddres : toAddress) {
                message.addRecipient(Message.RecipientType.TO, toAddres);
            }

            message.setSubject(subject);
            message.setText(text);

            Transport transport = session.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

            return true;
        } catch (AddressException ae) {
            System.out.println(ae);
            return false;
        } catch (MessagingException me) {
            System.out.println(me);
            return false;
        }
    }
}
