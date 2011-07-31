void mousePressed(){
  reload();
  mousePressed = false;
  reconnect = true;

}

void keyPressed(){
  keyPressed=false;

  if(keyCode == RIGHT){
    page+=1;
    keyCode=0;
    

  }
  if(keyCode == LEFT){
    page-=1;  
    keyCode=0;
 
  }
  page =constrain(page,0,PGS);
}

void renderImage(int p){

  p = constrain(p,1,PGS);
  
  //println(p);
    
  image(piece[p],0,0);

}

void reconnecting(){
  background(0);
  fill(255);
  text("reconnecting...",15,25);
  fill(255,65,15);
  rect(width-10,height-10,5,5);
  //image(front,0,0); 
  delay(1000);  
}
