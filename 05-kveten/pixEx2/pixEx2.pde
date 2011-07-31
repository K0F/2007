color[] col = new color[400*400];
color[] mrak = new color[400*400];
color[] way = new color[400*400];
color[] car = new color[200*202];
float cnt,noc=10000.0;
float speed=1,speedX,acc=1;
PImage a,mr,wa,ca,light;
float X=100,Y=-50,pos;


void setup(){
 size(400,200);
 frameRate(30);
 noStroke();
 background(155);
create();
  frame.setTitle(" Street Rod :: KOF");frame.show();
  
  //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  frame.setTitle(" Street Rod :: KOF");frame.show();
  //-----------------------*
  
}
void draw(){
  
  
  loadPixels();
for(int column = 1;column<height;column+=1){
  
  for(int i =0;i<width;i+=1){
   
     this.pixels[column*width+i]=color((int)brightness(col[column*width+int(i+cnt)%width])/(sin(cnt/noc)+2)); 
     
     if(mrak[column*width+int(i+cnt/3)%width]!=#FFFFFF){
     this.pixels[column*width+(i)]=color((int)brightness(mrak[column*width+int(i+cnt/3)%width])/(sin(cnt/noc)+2));; 
   }
   if(way[column*width+int(i+cnt*20)%width]!=#FFFFFF){
     this.pixels[column*width+(i)]=way[column*width+int(i+cnt*20)%width];
   }
  } 
 
 }
 updatePixels();
 acc=0;
 speedX=constrain(speedX+acc,-0.0,3);
  cnt+=1.1+(speedX);
 
 X+=pos;
 Y-=pos;
 //println(X);
 Y=constrain(Y,57,100);
 X =constrain(X,-115,321);
  
  pushMatrix();
  translate(X+sin(cnt/100.0)*5,Y+cos(cnt/1000.0)*2);
  tint(255-((sin(cnt/noc))*155));
 image(ca,0,0);
 tint(255,((sin(cnt/noc))*255));
 image(light,-14,0);
 popMatrix();
 if(!keyPressed){acc*=0.99;}
 pos*=0.95;
 
}

void mouseReleased(){

  create();
}

void create(){
 a = loadImage("oko.png");
 mr = loadImage("mrak.PNG");
 wa = loadImage("way.PNG");
  ca = loadImage("car2.PNG");
 
  
  light = loadImage("lightning.png");
  
   ca.filter(GRAY);
  wa.filter(GRAY);
  
  for(int column = 1;column<height;column+=1){
  for(int i =0;i<width;i+=1){
    col[column*width+i] = a.pixels[column*width+(i)];
    mrak[column*width+i] = mr.pixels[column*width+i];
    way[column*width+i] = wa.pixels[column*width+i];
   
  } 
 } 
  
  
}

void keyPressed(){
  if(keyCode==UP){
   pos+=0.3;
  
  }
  if(keyCode==DOWN){
     pos-=0.3;
   
  }
 

}
