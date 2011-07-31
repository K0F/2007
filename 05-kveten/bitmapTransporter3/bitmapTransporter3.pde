import processing.opengl.*;


PImage img;
PFont font;
color[] cData;
 color[] colors = {#FF0000,#00FF00,#0000FF,#FFFFFF};

int shift,posun,radek,hit,gamutR,gamutG,gamutB,gamut,XG;
float r,g,b;
float speed = 100;
float[][] values = new float[256][4];
 float[][] newValues = new float[256][4];
float minValue,maxValue;
String name = "Hyla_japonica_001.jpg";
boolean done =false;
void setup(){
  colorMode(RGB);
  frameRate(50);
  size(200,200,OPENGL);
  noSmooth();
  background(0); 
  frame.setTitle("imageDeconstructor");
  frame.show();
  
  font = loadFont("Uni0553-8.vlw");
  textFont(font,8);
  
  img = loadImage(name);
  cData = img.pixels;
  println(name+" loaded, continuing.. \n"+"data buffer contains "+cData.length +" point references");
  println("read ok, starting proccess..");
  speed= int((cData.length/50.0)/60.0);
}

void draw(){
 
 shift+=speed;
  if(shift>=cData.length-1){done=true;};
  
  if(!done){
  background(0);
  detector(cData[(shift+5)%cData.length]);
  thumb(((img.width*img.height)/(width*height))*2);
  procces(shift);
  histogram(shift,1);
  percentage(shift);
  }else{
   text("done",width-5,height-5);noLoop(); 
  }
}

void procces(int _shift){
  for(int  x = 0;x<width;x+=1){
    stroke(cData[(x+shift)%cData.length]);
    line(x,height/2,x,height/2+2); 
  }  

}

void thumb(int _downScale){
  
  for(int  x = 5;x<img.width;x+=_downScale){
    for(int  y = 0;y<img.height;y+=_downScale){


     
      stroke(cData[y*img.width+x]);
      line((width-5-img.width/_downScale)+x/_downScale,5+(y/_downScale),(width-5-img.width/_downScale)+x/_downScale,5+(y/_downScale)+0.1);
      // point(map(brightness(cData[y*img.width+x]),0,255,5,width-5),120-radek);
      
     if(shift==y*img.width+x){
     stroke(255);
        rect((width-5-img.width/_downScale)+x/_downScale,5+(y/_downScale),5,5); 
      }
      
    }
    //point(gamut,values[gamut]);
  } 







  hit=0;
}

void detector(color _color){

  r= red(_color);
  g=green(_color);
  b=blue(_color);

  noStroke();
  fill(r,0,0);
  rect(5,5,5,5);
  fill(0,g,0);
  rect(15,5,5,5);
  fill(0,0,b);
  rect(25,5,5,5); 
  fill(_color);
  rect(55,5,5,5);
  fill(hue(_color));
  rect(55,15,5,3);
  fill(saturation(_color));
  rect(55,20,5,3);
  fill(brightness(_color));
  rect(55,25,5,3);
  noFill();
  stroke(95);

  //sipka
  line(35,7,50,7);

  line(5,12,5,height/2);

  line(65,7,(width-10)-(img.width/(((img.width*img.height)/(width*height))*2)),7);

  beginShape();
  vertex(15,12);
  vertex(7,15);
  vertex(7,height/2);
  endShape();


  beginShape();
  vertex(25,12);
  vertex(9,17);
  vertex(9,height/2);
  endShape();

  stroke(255);


}

void histogram(int _far,int _resolution){
 
  for(int i = 0;i<_far;i+=_resolution){
     //kde v xu
    gamutR = (int)(red(cData[i])) ;
    gamutG = (int)(green(cData[i])) ;
    gamutB = (int)(blue(cData[i])) ;
    //gamut = (int)(brightness(cData[i]));
    
    //x plus jedna
    values[gamutR][0]+=0.1;
    values[gamutG][1]+=0.1;
    values[gamutB][2]+=0.1;
     //values[gamut][3]+=0.1;
   
  }
  
  for(int i = 0;i<3;i+=1){
    for(int q = 0;q<255;q+=1){
      
       if( maxValue<values[q][i]){
      maxValue=values[q][i];
    }
    if( minValue>values[q][i]){
      minValue=values[q][i];
    }
      }
    }
  
   
   beginShape();
    for(int i = 0;i<3;i+=1){
      beginShape();
      for(int q = 0;q<255;q+=1){
     
     newValues[q][i]= map(values[q][i],0,maxValue+0.1,height-5.0,height/2.0+5.0);
    XG = (int)map(q,0,255,5,width-5);
     
     stroke(colors[i],128);
    vertex(XG,newValues[q][i]);
   
    }endShape();
    }
 if(keyPressed) print("min"+minValue+"\n"+"max"+maxValue+"\n"); 
 


}

void percentage(int _posun){
 fill(255);
 textAlign(RIGHT);
 
 text(name+" >> "+( ceil(((_posun+0.001f) /cData.length)*100.0))+" %",width-5,height/2-5); 
  
  
}

