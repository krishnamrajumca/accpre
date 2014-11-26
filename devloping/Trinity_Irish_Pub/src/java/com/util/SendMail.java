/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import com.sun.mail.smtp.SMTPTransport;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.URLName;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

    public static boolean sendingMail(String msg,String to1) {
        System.out.println("to:"+to1);
        
   String host = "smtp.gmail.com";
    String from = "projectsrun@gmail.com";
    String pass = "krishna0608";
    Properties props = System.getProperties();
    props.put("mail.smtp.starttls.enable", "true"); // added this line
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.user", from);
    props.put("mail.smtp.password", pass);
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
try{
     // added this line
   String[] to=new String[2];
   to[0]=" accpre.tech@gmail.com";
    to[1]=from;

    Session session = Session.getDefaultInstance(props, null);
    MimeMessage message = new MimeMessage(session);
    message.setFrom(new InternetAddress(from));

    InternetAddress[] toAddress = new InternetAddress[to.length];

    // To get the array of addresses
    for( int i=0; i < to.length; i++ ) { // changed from a while loop
        toAddress[i] = new InternetAddress(to[i]);
    }
    System.out.println(Message.RecipientType.TO);

    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
        System.out.println("To:"+toAddress[i]);
        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
    }
    message.setSubject("Message From:"+to1);
    message.setText(msg);
    Transport transport = session.getTransport("smtp");
    transport.connect(host, from, pass);
    transport.sendMessage(message, message.getAllRecipients());
    transport.close();
            System.out.println("Done");
        /*Session session1 = Session.getDefaultInstance(props,
        new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("projectsrun@gmail.com","krishna0608");
        }
        });*/

            return true;

        } catch (MessagingException e) {
            System.out.println("Mailing ERRRRRRRORRRRRR    " +e);
            
            return false;
           // throw new RuntimeException(e);
        }
    }


}
