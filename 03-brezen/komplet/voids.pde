
void down(mkv.MyGUI.MyGUIButton listen, String universal,String name){
 
  if(listen.checkForHit()){

    PImage preview = loadImage(name+".bmp");
    rectMode(CORNER);
    fill(255);
    textAlign(LEFT);
    
    text(universal,(mouseX)+30,(mouseY),200,300);
    
    image(preview,mouseX+250,mouseY);
    
    if(mousePressed){
      mousePressed=false;
      println(name);
      listen.setStyle(used);
      
      //listen.setLabel("loading..");
      //frame.hide();
      
      String path = sketchPath;
      path = path.concat("/sources/"+name+"/"+name+".exe");
      println(path);
      link(path,"_new");
      delay(500);
      frame.setState(1);
      //frame.removeNotify();
      
  }


}
}

  
void contact(mkv.MyGUI.MyGUIButton listn){
  if(listn.hasFocus()&&mousePressed){
  link("mailto:kof@seznam.cz");
  mousePressed=false;
  }
  
  
}

void goToSleep(int interval){
try { 
   Thread.sleep(interval); 
 } 
 catch(InterruptedException e) {println(e);} 
}

