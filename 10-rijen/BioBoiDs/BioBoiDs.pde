import processing.video.*;
import processing.opengl.*;

MovieMaker mm;
float x,y;
int num = 300;
Node[] node = new Node[num];
float globD;
int fram;

void setup(){

  size(576,312);

  background(0);
  stroke(255,24);

  mm = new MovieMaker(this, width, height, "drawing.mov",30, MovieMaker.JPEG, MovieMaker.HIGH);


  for(int i =0;i<num;i++){
    node[i]=new Node(i);

  }

  println("runnin'");
}

void draw(){ 
  globD = 0;
  
  for(int i =0;i<num;i++){
    node[i].drw(); 
    globD+=node[i].distance; 
  }
 // println(globD/node.length);
  if(globD/num<110){
    mm.addFrame(); 
    fram++;
  }
  
  if(globD/num<109){
    background(0); 
     for(int i =0;i<num;i++){
    node[i]=new Node(i);
  }
   println((fram/30.0)+" seconds"); 
  }

}

void keyPressed() {
  if (key == ' ') {
    mm.finish();  // Finish the movie if space bar is pressed!
    println("finished!");
  }
}

