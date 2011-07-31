public class SimpleSender

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
{
  /**
    * Main method to send a message given on the command line.
    */
  public void send(String args[])
  {
    try
    {
      
      String smtpServer = args[0];
      String to=args[1];
      String from=args[2];
      String subject=args[3];
      String body=args[4];
      snd(smtpServer, to, from, subject, body);
    }
    catch (Exception ex)
    {
      System.out.println("Usage: java com.lotontech.mail.SimpleSender"
       +" smtpServer toAddress fromAddress subjectText bodyText");
    }
   // System.exit(0);
  }


  public void snd(String smtpServer, String to, String from , String subject, String body)
  {
    try
    {
      Properties props = System.getProperties();
      // -- Attaching to default Session, or we could start a new one --
      props.put("mail.smtp.host", smtpServer);
      Session session = Session.getDefaultInstance(props, null);
      // -- Create a new message --
      Message msg = new MimeMessage(session);
      // -- Set the FROM and TO fields --
      msg.setFrom(new InternetAddress(from));
      msg.setRecipients(Message.RecipientType.TO,
        InternetAddress.parse(to, false));
      // -- We could include CC recipients too --
      // if (cc != null)
      // msg.setRecipients(Message.RecipientType.CC
      // ,InternetAddress.parse(cc, false));
      // -- Set the subject and body text --
      msg.setSubject(subject);
      msg.setText(body);
      // -- Set some other header information --
      msg.setHeader("X-Mailer", "LOTONtechEmail");
      msg.setSentDate(new Date());
      // -- Send the message --
      Transport.send(msg);
      System.out.println("Message sent OK.");
    }
    catch (Exception ex)
    {
      ex.printStackTrace();
    }
  }
}
