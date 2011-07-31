/**
* java m@ilerDemon by kof \n
*
*
*
*/

/**
*   source , target
*/
 String[] ms = {"smtp.chello.cz","rbot@seznam.cz"};

SimpleSender s;
PFont p;
int logg = 0;

String[] mess;
int noMsgs = 0;

void setup(){
 size(200,400);
 frameRate(30);
 
 p = loadFont("Dialog.plain-9.vlw");
 textFont(p);
  s = new SimpleSender();
  frame.setTitle("m@ilerDemon");
 
}

void draw(){
 
  background(0);
  
  viz();
  
}

void viz(){
  
  text(noMsgs,width-50,height-12);
  for(int i = 0;i<logg;i++){
     if(i==0){
     fill(#11FF11);
     }else if(i==1){
        fill(#FF1111);
     }else if (i == 2){
        fill(#FFFFFF);
     } else if (i == 3){
        fill(#FFCC11);
     } else {
      fill(#CCCCCC); 
     }
     
     if(!mess[1].equals("")){
     if(i<4){
 text(mess[i]+"\n",12,12+i*12);
     }else{
       text("\n\t"+mess[i],12,12+i*12);
     }
     }else{
        fill(#CCCCCC); 
       text("\n click to generate message",12,12);
       
     }
 } 
  
}

String generate(String _tmp,int mode){
  
  switch (mode){
   case 0:
   //message
  for(int i = 0;i<(int)random(150,800);i++){
   _tmp+=(char)random(65,90);
    _tmp+=(char)random(97,122);
   if ((i%15==0)&&(i!=0)){
    _tmp+="\n"; 
   }
  } 
 
  break;
  
  case 1:
   //subject
  for(int i = 0;i<(int)random(3,7);i++){
   _tmp+=(char)random(65,90);
   _tmp+=(char)random(97,122);
  } 

  break;
  
  case 2:
   //name
  for(int i = 0;i<(int)random(3,7);i++){
  // _tmp+=(char)random(65,90);
    _tmp+=(char)random(97,122);
  } 
  _tmp+="@";
   for(int i = 0;i<(int)random(2,6);i++){
 //  _tmp+=(char)random(65,90);
    _tmp+=(char)random(97,122);
  }
  _tmp+=".hack"; 
  
  
  break;
   
    
  }
  
   return _tmp;
}

void msgGen(String[] args){
 
 String message="",subject="",name="";
message = generate(message,0);
subject = generate(subject,1);
name = generate(name,2);

String[] setupV  = {args[0],args[1],name,subject,message};
logg = setupV.length;
mess=setupV;
 /*for(int i = 0;i<logg;i++){
 println(setupV[i]);
 }*/

try{
 s.send(setupV); 
 noMsgs++;
mess[logg-1]+="\n\n message send ok!"; 
}catch (Exception e){
 System.out.println(e); 
}  
  
}

void mousePressed(){
 
  msgGen(ms);  
  
}
