void mousePressed(){
  fullRest();

}

void fullRest(){
  for(int i = 0;i<obj.length;i++){

    obj[i].tx = random(width);
    obj[i].ty = random(height);
  } 

}



void chosen(int[] pnts){



  //legend

  beginShape(QUADS);
  texture(img);
  fill(255,25);
  
  vertex(obj[pnts[0]].x,obj[pnts[0]].y,posX[0],posY[0]);  
  vertex(obj[pnts[1]].x,obj[pnts[1]].y,posX[1],posY[1]);  
  vertex(obj[pnts[2]].x,obj[pnts[2]].y,posX[2],posY[2]);  
  vertex(obj[pnts[3]].x,obj[pnts[3]].y,posX[3],posY[3]);    
 
  
  endShape(CLOSE);
  
   for(int i = 0;i<4;i++){
    rect(obj[pnts[i]].x-obj[pnts[i]].radius/2,obj[pnts[i]].y-obj[pnts[i]].radius/2,obj[pnts[i]].radius,obj[pnts[i]].radius);
  }
}

void last(){

  int L = left();
  int R = right();
  int U = up();
  int B = bottom();

  rect(obj[L].x-obj[L].radius/2,obj[L].y-obj[L].radius/2,obj[L].radius,obj[L].radius);
  rect(obj[R].x-obj[R].radius/2,obj[R].y-obj[R].radius/2,obj[R].radius,obj[R].radius); 
  rect(obj[U].x-obj[U].radius/2,obj[U].y-obj[U].radius/2,obj[U].radius,obj[U].radius); 
  rect(obj[B].x-obj[B].radius/2,obj[B].y-obj[B].radius/2,obj[B].radius,obj[B].radius);
  beginShape();
  fill(0,55);
  vertex(obj[L].x-obj[L].radius/2,obj[L].y-obj[L].radius/2);
  vertex(obj[U].x-obj[U].radius/2,obj[U].y-obj[U].radius/2);
  vertex(obj[R].x-obj[R].radius/2,obj[R].y-obj[R].radius/2);
  vertex(obj[B].x-obj[B].radius/2,obj[B].y-obj[B].radius/2); 
  endShape(CLOSE);
}

int left(){
  float val = width;
  int which = 0;
  for(int i = 0;i<obj.length;i++){
    if(val>obj[i].x){
      val = obj[i].x;
      which = i;
    }
  }  
  return which;
}

int right(){
  float val = 0;
  int which = 0;
  for(int i = 0;i<obj.length;i++){
    if(val<obj[i].x){
      val = obj[i].x;
      which = i;
    }
  }  
  return which;
}

int up(){
  float val = width;
  int which = 0;
  for(int i = 0;i<obj.length;i++){
    if(val>obj[i].y){
      val = obj[i].y;
      which = i;
    }
  }  
  return which;
}

int bottom(){
  float val = 0;
  int which = 0;
  for(int i = 0;i<obj.length;i++){
    if(val<obj[i].y){
      val = obj[i].y;
      which = i;
    }
  }  
  return which;
}
