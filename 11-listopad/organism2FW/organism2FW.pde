//----------------------- >

import processing.opengl.*;

//----------------------- >
int mode = 3; //rec , play, preform
//----------------------- >

int num = 2000;
PrintWriter output;
Organism[] o = new Organism[num];
PImage[] bank = new PImage[5];
String name[] = {
  "steady.png","steady2.png","steady3.png","steady4.png"};

String posit[];

int cnt;
boolean recording = false;
boolean playing = false;
//----------------------- >

void setup(){
  size(720,576,OPENGL);  
  background(0);

  for(int i = 0;i<name.length;i++){
    bank[i] = loadImage(name[i]);
  }

  for(int i = 0;i<num;i++){
    o[i] = new Organism(i,3.80,2); 
  }

  // fileManipulator(mode);

  // smooth();
  
  noStroke();
}

//----------------------- >

void draw(){

  if(mode==1){
    output.println(o[0].x+":"+o[0].y); // Write the coordinate to the file
  }
  else if(mode == 2){
    cnt = frameCount%(posit.length-1);
    String[] q = splitTokens(posit[cnt],":");
    o[0].tx=parseFloat(q[0]);
    o[0].ty=parseFloat(q[1]); 
  }


  //fade(0,255);
  background(0);
  for(int i = 0;i<num;i++){
    o[i].run();
  } 
  
  display(mode);


}

//----------------------- >

void fade(color q,int o){
  noStroke();
  fill(q,o);
  rect(0,0,width,height); 

}

void mousePressed(){
  if(mouseButton==LEFT){
    if((!recording)&&(!playing)){
      mode=1;
      fileManipulator(mode);
      recording=true;
    }
    else{
      output.flush(); // Writes the remaining data to the file
      output.close(); // Finishes the file
      recording=false;
      mode=3;
    }
  }
  else if(mouseButton==RIGHT){
    if((!recording)&&(!playing)){
      mode=2;
      fileManipulator(mode);
      playing=true;
    }
    else{
      playing=false;
      mode=3;  
    } 
  } 
  mousePressed = false;
}

void fileManipulator(int _mode){
  switch(_mode){
  case 1:
    output = createWriter("positions.kof"); 
    break;
  case 2:
    posit = new String[loadStrings(sketchPath+"/positions.txt").length];
    posit = loadStrings(sketchPath+"/positions.kof");
    break;
  }
}

void display(int _mode){
 switch(_mode){
  case 1:
  fill(#FF0000,155);  
  break;
  case 2:
  fill(#00FF00,155);  
  break;
  case 3:
  fill(#FFFF00,155);  
  break;
  
 } 
  ellipse(width-20,20,10,10);
  
}


//----------------------- >

/*

 
 
 */
