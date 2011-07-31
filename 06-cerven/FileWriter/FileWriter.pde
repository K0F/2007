// POST IT
boolean has_posted = false;
int gPoints = 1;
String strName = "Kofa";
String[] parameter = {"time","name"};
String date = ((int)hour())+":"+((int)minute())+"_ "+((int)day())+"."+((int)month())+". "+((int)year());
String[] value = { date+"  _"+gPoints, strName };
String recv = new String();
String str = "CONNECTING";

void setup(){
  size(300,300);                                     // Sets window-size to x,y
  frameRate(30);
  PFont fontA = loadFont("00Acrobatix-8.vlw");            // Loads font
  textFont(fontA);                               // Sets font-size
  textMode(SCREEN);
}

void draw(){
  background(71);
  text(str,10,20);
  if(has_posted){
   text(recv,10,50,width-20,height-60);
  }
}

void keyPressed(){
 if (keyCode==ENTER){
  send(parameter,value);
 } 
 
 keyCode=0;
  
  
}

void send(String[] _parameter,String[] _value){
 
  if(!has_posted){
    boolean worked = postNewItem(_parameter,_value, "http://weirdplace.wz.cz/write/writer.php");
    if(worked){
      str = "SUCCESS";
   
    }else{
      str = "FAILURE";
    }
    has_posted = true;
  }
    
}



boolean postNewItem (String[] Par, String[] Val, String strURL) {  
 boolean ret = false;
 try {  
   URL url;  
   URLConnection urlConn;  
   DataOutputStream   dos;  
   DataInputStream    dis;  
   String s = "";
   String S = "";
   String query = ""; 

   // generate the query-string (for multiple parameters)
   for(int i = 0; i < parameter.length; i++){
     if(i == 0){
       query += "?nump="+parameter.length+"&";
     }else{
       query += "&";
     }
     query += "p"+(i+1)+"="+parameter[i];
   }  
  
   url = new URL(strURL + query);  
   urlConn = url.openConnection();  
   urlConn.setDoInput(true);  
   urlConn.setDoOutput(true);  
   urlConn.setUseCaches(false);  
   urlConn.setRequestProperty ("Content-Type", "application/x-www-form-urlencoded");  
  
   dos = new DataOutputStream (urlConn.getOutputStream());  
   
   // generate the post-string
   for (int i=0; i<Par.length; i++) 
   {
    if (S.length() > 0) S += "&";
    S += Par[i] + "=" + Val[i];
   }

   // SEND
   String message=S;  
   dos.writeBytes(message);  
   dos.flush();  
   dos.close();  

   // RECIEVE  
   dis = new DataInputStream(urlConn.getInputStream());  
   s = dis.readLine();        
   dis.close();  

   println(s);       // if it outputs success, and nothing happens check this out..
   if (s != "") {    // Got Some reply 
     ret = true;
     recv = "";    
     recv = s;
    
     
   } else {  
     ret = false;  
   }  
  
 } // end of "try"  
  
 catch (MalformedURLException mue) {  
   ;   
 }  
 catch (IOException ioe) {  
   ;   
 }  
 return ret; 
}  // end of postNewItem() method  

