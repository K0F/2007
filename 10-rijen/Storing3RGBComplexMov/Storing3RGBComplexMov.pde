/**
* Structure with simple rules behaving like an organism in complexity.
*  No random used except first positioning of objects. by Kof 07
*/

import processing.video.*;
import processing.opengl.*;

//--------------------------> params 
Obj[] obj = new Obj[2000];
boolean record = true;
String name = "map8";
//--------------------------> movie obj 
MovieMaker mm;

//--------------------------> stp 
void setup(){
  size(720,576,OPENGL); 
  //--------------------------> objects creation 
  for(int i = 0;i<obj.length;i++){
    float xxx = random(width);
    obj[i] = new Obj(xxx,random(height),1,12.0,lerpColor(#ffcc00,#ccff00,map(xxx,0,width,0.0,1.0)),i);
 }
  //--------------------------> drawing settings 
  smooth();  
  textFont(loadFont("04b24-8.vlw"));  
  //strokeJoin(ROUND);
  //--------------------------> movie creating 
  if(record){
    mm = new MovieMaker(this,width,height,name+".mov",25,MovieMaker.JPEG,MovieMaker.HIGH);
  }  
  background(0);  
}

//--------------------------> draw loop 
void draw(){  
  fill(map(obj[obj.length-1].x,0,width,15,255),map(obj[obj.length-2].x,0,width,15,255),map(obj[obj.length-3].x,0,width,15,255),15);
  rect(0,0,width,height);
  //--------------------------> objects loop 
  for(int i = 0;i<obj.length;i++){
    obj[i].run();
  }  
  //--------------------------> recored frame 
  if(record){  
    mm.addFrame(); 
  }  
}

//--------------------------> for record endings 
void keyPressed(){
  if(record){    
    if(keyCode==ENTER){
      mm.finish();
      println("finish");
    }    
  }  
}



