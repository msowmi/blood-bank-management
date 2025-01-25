/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mypackage;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
  
import javax.activation.*; 
import javax.mail.Authenticator;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author Sowmi
 */
public class SendEmail {
    static String email;
    static String blood;
    static String city;
    static String hospital;
    static String reqid;
    static String fname;
    static String lname;
    static String contact;
    public SendEmail(String e,String f,String l,String con,String h,String c,String b){
        this.email=e;
        this.fname=f;
        this.lname=l;
        this.contact = con;
        this.hospital=h;
        this.city=c;
        this.blood=b;
        
    }
   public void sendingMailToRecipient() throws MessagingException{ 
        System.out.println("Preparing to send mail");
        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        final String myAccountEmail = "bloodcount24@gmail.com";
        final String password = "zqbecbdwqzcdzjqs";

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                System.out.println(myAccountEmail);
                 System.out.println(password); 
                return new PasswordAuthentication(myAccountEmail, password);
            }
        });
        Message message = prepareMessage(session, myAccountEmail, email);

        Transport.send(message);
        System.out.println("Message sent successfully!");
    }

    private static Message prepareMessage(Session session, String myAccountEmail, String recepient) throws MessagingException {
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(myAccountEmail));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
        message.setSubject("Urgently required "+blood+" blood");
        message.setText("Luckily you are elligible for donation! \nRequested by: "+fname+" "+lname+" \nHospital: "+hospital+", "+city+" \nContact: "+contact+"");
        return message;
    }
    }
    

