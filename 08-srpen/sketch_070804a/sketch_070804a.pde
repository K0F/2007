import jms4spread.*;

import java.io.*;


class rcvThread extends Thread {

  TopicSubscriber topicSubscriber;

  rcvThread(TopicSubscriber ts){
    topicSubscriber = ts;
  }

  public void run(){
    String text = new String();
    while(true){
      try {
      	text = ((TextMessage)topicSubscriber.receive()).getText();
      } catch(JMSException e){
				e.printStackTrace();
				System.out.println("JMS Exception");
      }
      System.out.println("recieved message: " +text);
    }
  }
}


public class test {
  public static void main(String [] args) throws IOException {
    System.out.println("Test why :)");
    String text;

    Topic topic;
    TopicConnectionFactory topicConnectionFactory;
    TopicConnection topicConnection;
    TopicSession topicSession;  
    TopicSubscriber topicSubscriber;
    TopicPublisher topicPublisher;

    BufferedReader stdin = new BufferedReader
	(new InputStreamReader(System.in));

    topic = new Topic("cnds");
    topicConnectionFactory = new TopicConnectionFactory();
	
    try {
      topicConnection= topicConnectionFactory.createTopicConnection();
      topicSession = topicConnection.createTopicSession(false,
			Session.AUTO_ACKNOWLEDGE );
      topicPublisher = topicSession.createPublisher(topic);
      topicSubscriber = topicSession.createSubscriber(topic);
      topicConnection.start();
    
  /*    //testing Stream here
		
      System.out.println("testing stream messages");
      StreamMessage sm = topicSession.createStreamMessage();
      String sms1 = "whhhaahhhaaa";
      System.out.println(sms1);
      sm.writeObject(sms1);
      sm.reset();
      topicPublisher.publish(sm);
      String sms2 = (String)((StreamMessage)
			topicSubscriber.receive()).readObject();
      System.out.println(sms2);
      if(sms1.equals(sms2))
        System.out.println("stream message test pass");
      else
        System.out.println("stream message test fail");
      //testing Stream ends here


      //testing MapMessage here
      System.out.println("testing MapMessage :) ");
      MapMessage mm = topicSession.createMapMessage(); 
      String sms3 = "testing bytes";
      System.out.println(sms3);
      mm.setBytes("test", sms3.getBytes());
      topicPublisher.publish(mm);
      String sms4 = new String((mm = (MapMessage)
	 topicSubscriber.receive()).getBytes("test"));
      System.out.println(sms4);
      //mm.setString("not", "should not work!");
      if(sms3.equals(sms4))
        System.out.println("MapMessage test pass");
      else
        System.out.println("MapMessage test fail");

      //testing MapMessage ends here
    */  
      rcvThread t = new rcvThread(topicSubscriber);
      t.start();
      TextMessage tm= topicSession.createTextMessage();
      tm.setText("testing this jms");
      System.out.println("! a ");
      topicPublisher.publish(tm);
      System.out.println("! b ");
      while(true){
        tm.setText(stdin.readLine());
        topicPublisher.publish(tm);
      }
    }catch (JMSException jmse){
      jmse.printStackTrace();
      System.out.println("JMSException :"+ jmse.toString() );
    }
  }


}
