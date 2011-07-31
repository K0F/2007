class Node{
  float x,y,tx,ty;
  int id;
  float distance;
  float speed = 20;
  float radius = 80;
  int noNe = 0;
  
  Node(int _id){
    id =_id;
    tx=x=random(width);
    ty=y=random(height);
  } 

  void compute(){
   /* tx += (random(width)-tx)/speed;
    ty += (random(height)-ty)/speed;
*/
    x += (tx-x)/speed;
    y += (ty-y)/speed;

    noNe = 0;
    
    for(int i = 0;i<node.length;i++){
      distance=dist(node[i].x,node[i].y,x,y);
      if((distance<=radius)&&(id!=i)){
      
        tx += (node[i].x-tx)/(noNe+constrain(distance,1.01,width));
        ty += (node[i].y-ty)/(noNe+constrain(distance,1.01,width));
        
        noNe ++;
      }//end If
      
      if((distance<10)&&(id!=i)){
         tx += (tx-node[i].x)/(noNe+constrain(distance,1.01,width));
        ty += (ty-node[i].y)/(noNe+constrain(distance,1.01,width));
      }
      
    }//end Loop
    
    borders();
    
    
  }//end Function
  
  void borders(){
   if(x>width){x=width;}
    if(x<0){x=0;}
   if(y>height){y=height;}
  if(y<0) {y=0;}
    
  }
  
  void drw(){
    compute();
  //set((int)x,(int)y,color(#FFCC00,25)); 
    stroke(#FFCC00,15);
    line(x,y,x+1,y);
  }

}
