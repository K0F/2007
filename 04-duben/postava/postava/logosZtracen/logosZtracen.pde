import processing.opengl.*;

PImage tree,pos,pos2;
PFont font;

int[] cnt = new int[700];

void setup(){
  size(700,300,OPENGL);  
  frameRate(30);
  /*setFullScreen( true );               // get fullscreen exclusive mode
  setResolution( screen.width, screen.height );           // treenge resolution to 640, 480
  createFullScreenKeyBindings();       // let ctrl+f switch to window mode*/
  font = loadFont("00Acrobatix-8.vlw");
  textFont(font,8);
  
  background(255);
   pos2=  loadImage("postava2.png");
  tree = loadImage("stromdark2.png");
  pos =  loadImage("postava.png");
  //noLoop(); 
}

void draw(){



  fill(255,1);
  stroke(0,55);
  rect(0,1,width-1,height-2);
  
  drawtree();
   postava();
   fill(0);
  text("mentalni krajiny, les :: krystof pesek",width-190,height-8);
  fill(color(#666666));
  text("mentalni krajiny, les :: krystof pesek",width-190,height-8);
}

void mousePressed(){
  tree = loadImage("stromdark2.png");
  pos=  loadImage("postava.png");
   pos2=  loadImage("postava2.png");
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
      translate(random(-tree.width,width),75+(height-200-(i*tree.height-(i*140))/620.0)+random(-400.0,400.0)/(700-i));
      scale(xscale*random(0.7,1.2),1); 
     
      tint(255,i*0.5);
      image(tree,0,55,(i*tree.width)/600.0,(i*tree.height)/600.0);

      popMatrix();
    }
  }  
   
}

void postava(){
  pushMatrix();
  translate((0.43*width),(0.66*height)-90);
  scale(-1,1);
  tint(55,25); 
 image(pos,0,20,pos.width/4.0,pos.height/4.0); 
 
  image(pos2,0,20,pos.width/4.0,pos.height/4.0);
  
 
  popMatrix();
  
}


/*v obarzu stojim nehybne a jen pozoruji veci kolem me jak se odvijeji,
jako tento komentar na konci programu ketry program vynecha
deje se i v krajinach to hlavni mimo program 
*/ 
