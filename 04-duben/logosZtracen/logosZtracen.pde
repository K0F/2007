import processing.opengl.*;

PImage tree,pos;
PFont font;

int[] cnt = new int[700];

void setup(){
  size(1000,500,OPENGL);  
  frameRate(30);
  setFullScreen( true );               // get fullscreen exclusive mode
  setResolution( screen.width, screen.height );           // treenge resolution to 640, 480
  createFullScreenKeyBindings();       // let ctrl+f switch to window mode*/
  font = loadFont("00Acrobatix-8.vlw");
  textFont(font,8);
  
  background(255);
  tree = loadImage("stromdark2.png");
  pos =  loadImage("postava.png");
  //noLoop(); 
}

void draw(){



  fill(255,1*0.7);
  stroke(0,55);
  rect(0,1,width-1,height-2);
  
  drawtree();
   postava();
   fill(0,55);
  text("logos, lost in wood :: krystof pesek",width-190,height-8);
  fill(color(#743224));
  text("logos, lost in wood :: krystof pesek",width-190,height-8);
}

void mousePressed(){
  tree = loadImage("stromdark2.png");
  pos=  loadImage("postava.png");
  font = loadFont("00Acrobatix-8.vlw");
  textFont(font,8);
}

void drawtree(){

  for(int i=1;i<700;i+=10){
    
    cnt[i]+=int(random(0.0,5.0));
    if(cnt[i]%20==0){
      cnt[i]=0;
      pushMatrix();
      float xscale = (random(0.0,3.0)>=1.5) ? 1f : -1f;
      translate(random(-tree.width,width),75+(height-200-(i*tree.height-(i*140))/300.0)+random(-800.0,800.0)/(700-i));
      scale(xscale*random(0.7,1.2),1); 
     
      tint(255,i*0.5);
      image(tree,0,0,(i*tree.width)/300.0,(i*tree.height)/300.0);

      popMatrix();
    }
  }  
   
}

void postava(){
  pushMatrix();
  translate((0.33*width),(0.66*height)-90);
  scale(-1,1);
 tint(55,15);
 image(pos,0,0,pos.width/3.0,pos.height/3.0); 
  popMatrix();
  
}
