void mousePressed(){
  fullRest();

}

void fullRest(){
  for(int i = 0;i<obj.length;i++){

    obj[i].tx = random(width);
    obj[i].ty = random(height);
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
