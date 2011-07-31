import processing.opengl.*;


PImage back,andel;
PImage[] holub = new PImage[4];
PFont font;
int cnt,col = 1,num=10;
float[] posX = new float[num];
float[] posY = new float[num]; 
void setup(){
  for(int i =1;i<=3;i++){
   holub[i] = loadImage(i+".png"); 
    posX[i] = random(width); 
    posY[i] = random(height); 
}

  back=loadImage("andelbck.png");
  andel = loadImage("andel.png");
 font =loadFont("ArialUnicodeMS-48.vlw");
 textFont(font,48);
 size (back.width/2,back.height/2,OPENGL);
 
  backGround(255,255);
  
  
}

void draw(){
 backGround(255,95);
  cnt++;
  fill(0,115);
  text("nervous angel lost his wings",5,120,180,height);
  /*for(int i = 0;i<10;i++){
    let(posX[i]-100,posY[i]-100,random(2),col,25,i);
  }*/
  tint(255,255);
 
  image(andel,sin((cnt/100.0)-2)*30.0,0,andel.width/2.0,andel.height/2.0);
 
 if(cnt%13==0){
  col+=1; 
 }
  if(col>3){col=1;}
  
  
}

void backGround(float colos,int fade){
  tint(colos,fade);
 image(back,0,0,back.width/2,back.height/2); 
  
  
}

void let(float X, float Y,float rotat,int faze,int opacti,int id){
  pushMatrix();
  rotate(radians(rotat));
  faze=constrain(faze,1,3);
  tint(255,opacti);
  image(holub[faze],X,Y,holub[1].width,holub[1].height);  
  popMatrix();
  
}

