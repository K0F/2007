import processing.video.*;
import processing.opengl.*;

MovieMaker mm;
float x,y;
int num = 3000;
Node[] node = new Node[num];
float globD;
int fram;

void setup(){

  size(720,576);

  background(0);
  stroke(255,24);

  mm = new MovieMaker(this, width, height, "drawing.mov",25, MovieMaker.JPEG, MovieMaker.HIGH);


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

  mm.addFrame(); 

}

void keyPressed() {
  if (key == ' ') {
    mm.finish();  // Finish the movie if space bar is pressed!
    println("finished!");
  }
}

