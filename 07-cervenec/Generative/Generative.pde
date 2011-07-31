
SmartSys s;

void setup(){
  
 size(300,300); 

 noFill();
 background(0);
  s=new SmartSys();
  pushMatrix();
  translate(width/2,height/1.5);
  
   s.degenerate();
  
  popMatrix(); 
}




class SmartSys{
  String t = "T";
  String c = "C";
  String g = "G";
  String a = "A";
 String dnk;
 int generation = 0;
 int gennum = 1524;
 int [] keyD = {1,2,3,5,8,13,21,34,55,89,144};
float theta = radians(60f);
float alph = 25f;
SmartSys(){
}



void degenerate(){
  dnk = "START  : ";
 for(int i = 0;i<gennum;i++){
   if(i%keyD[(i%keyD.length)] == 0){
  dnk += t;
   } else  if(i%keyD[(i%keyD.length)] == 1){
       dnk += c;
   }else  if(i%keyD[(i%keyD.length)] == 2){
       dnk += g;
   }else  if(i%keyD[(i%keyD.length)] == 3){
       dnk += a;
   }
   
 //  dnk+="-";
   
  
  
  
 } 
  
  //print(dnk);
  build(dnk);
}

void build(String _input){
  
  for(int i = 0;i<_input.length();i++){
   switch(_input.charAt(i)){
     
    case 'T':
    
    rect(0,0,-5,-5);
    stroke(#FF0000,alph);
    rotate(-theta);
    break;
    case 'C':
    rect(0,0,5,5);
    stroke(#FFFF00,alph);
    rotate(theta);
    break;
    case 'G':
    
    translate(0,6);
    stroke(#00FF00,alph);
    break;
    case 'A':

    translate(6,0);
    stroke(#00FFFF,alph);
    break;
   } 
  
  }
}
  
}
