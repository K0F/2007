
byte[] data = new byte[400];
PImage img = createImage(50,50,RGB);
void setup(){
   size(200,200);
   init();
  for(int i = 0;i<data.length;i++){
    data[i]=byte((int)random(128)); 
  }
}

public void draw(){
  background(0);

}



public void keyPressed(){
  if(keyCode==ENTER){
    try{
      String s = sketchPath+"/data.txt";
      String s2 = "c:\test\kof.png";
      saveBytes(s,data);
      println("success, file save to: "+s);
      img.save(s2);
      println("success, image save to: "+s2);
    }
    catch(Exception e){
      println("can't create a file!, error: " + e);
    }
  } 
keyCode=0;
}
