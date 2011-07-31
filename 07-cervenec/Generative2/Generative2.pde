import processing.opengl.*;


SmartSys s;

void setup(){
  
 size(300,300,OPENGL); 
frameRate(25);
 noFill();
 background(0);
  s=new SmartSys();
  pushMatrix();
  translate(width/2,height/2);
  
   s.degenerate();
  
  popMatrix(); 
}

void draw(){

  pushMatrix();
  translate(width/2,height/2);
 // background(0);
 s.restart(); 
  popMatrix(); 

}

void keyPressed(){

  pushMatrix();
  translate(width/2,height/2);
  background(0);
 s.restart(); 
  popMatrix(); 

}




class SmartSys{
  String t = "T";
  String c = "C";
  String g = "G";
  String a = "A";
 String dnk;
 int generation = 0;
 int gennum = 600;
 int [] keyD = {4,6,9};//,3,5,8,13,21,34,55,89,144};
float theta = radians(60f);
float alph = 3f;
int add = 2;
color[] cols = {#FF0C00,#0CFF0C,#00CFFF,#0000FF};
SmartSys(){
}

void restart(){
  int which = (int)random(0,keyD.length);
 keyD[which]+=add;
keyD[which]=keyD[which]%gennum;

 degenerate();

}


void degenerate(){
  dnk = " ";
 for(int i = 1;i<gennum;i++){
   if(keyD[(i%keyD.length)]!=0){
     
   if(i%keyD[(i%keyD.length)] == 0){
       dnk += t;
   } else  if(i%keyD[(i%keyD.length)] == 1){
       dnk += c;
   }else  if(i%keyD[(i%keyD.length)] == 2){
       dnk += g;
   }else  if(i%keyD[(i%keyD.length)] == 3){
       dnk += a;
   }
   }
 //  dnk+="-";
   
  
  
  
 } 
  
  //print(dnk);
  build(dnk,13);
}

void build(String _input, int _rozpon){
  
  for(int i = 0;i<_input.length();i++){
   switch(_input.charAt(i)){
     
    case 'T':
    
    rect(0,0,-_rozpon,-_rozpon);
    stroke(cols[0],alph);
    rotate(-theta);
    translate(0,-_rozpon);
    break;
    
    case 'C':
    
     rect(0,0,_rozpon,_rozpon);
    stroke(cols[1],alph);
    rotate(theta);
    translate(0,_rozpon);
    break;
    
    case 'G':
    
     rect(0,0,_rozpon,-_rozpon);
    stroke(cols[2],alph);
    rotate(-theta);
    translate(0,-_rozpon);
    break;
    
    case 'A':
    
    rect(0,0,-_rozpon,_rozpon);
    stroke(cols[3],alph);
    rotate(theta);
    translate(0,_rozpon);
    break;
   } 
  
  }
}
  
}
