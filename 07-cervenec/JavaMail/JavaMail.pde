

SimpleSender s;
String[] setupV = {"smtp.adsl.cz","rbot@seznam.cz","R@BoT.qes","hack","your mail-box has been hacked by roboMailer!"};

void setup(){
 size(200,200); 
 s = new SimpleSender();
  //for(int i = 0;i<3;i++){
  s.send(setupV);
  //}
}

void draw(){
  background(0);
  
  
}
