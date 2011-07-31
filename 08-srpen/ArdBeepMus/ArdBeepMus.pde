Communicator c;


void setup(){
 size(200,200);
  
 c=new Communicator(this, 14200); 
 c.send(50); 
}

void draw(){
 background(0); 
  
}

void mousePressed(){
 c.send((int)(mouseX/10f)); 
  mousePressed=false;
}

void dispose(){
 c.send(1000); 
  
  
}
