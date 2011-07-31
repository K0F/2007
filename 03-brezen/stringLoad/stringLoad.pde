FTPClient ftp; 
PFont font;
String lines[]; 

int cnt;
boolean reconnect = false;
void setup(){
  size(200,320);
  frameRate(50);
  frame.setTitle("notes engine by kof");
  frame.show();
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  
  font = loadFont("Uni0553-8.vlw");
  textFont(font);
  background(0);
  
  lines= loadStrings("http://weirdplace.wz.cz/text.txt");
  if (lines==null){text("connection problem occured",10,20);}
 
 
  
}

void draw(){
  background(0);
 if(reconnect){
  
   text("reconnecting...",10,20); 
  delay(1500);  
 }else{
  for (int i=0; i < lines.length; i++) {
     /*String singleline = lines[i]+"";
     println(singleline);
     char weird = singleline.charAt(2);
    if(weird=='*'){fill(255,0,0);}else{fill(255);}*/
    fill(255);
    text(lines[i],15,(i*8)+20);
  }
  
  cnt++;
  fill((sin(cnt/10.0)+1)*255);
 rect(width-10,height-10,5,5); 
 }reconnect = false;
}

void mousePressed(){
   
  mousePressed = false;
 this.exit();
 /* //frame.hide();
  reconnect = true;
    
  
   lines= loadStrings("http://weirdplace.wz.cz/text.txt");
*/
}
