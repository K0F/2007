int posun = 300;
int posledni;


void rozbaleni(){

  for(int x = 0;x<button.length;x++){
     button[x].y+=( button[x].target-button[x].y)/button[x].speed;
   if((button[x].y>button[constrain(x+1,0,button.length-1)].y)){button[x].target=button[x].startY;}
    if((abs(mouseY-button[x].y)<10)&&(aktivni)){ // jeslize oznaceno
      //println(x);
     
      rozbalTo(x);
         button[x].rozbaleno=true;
    } 
  }
    

}

void rozbalTo(int _ktera){
  if(_ktera!=posledni){ 
    
    button[_ktera].target=int(button[_ktera].startY);
    //button[_ktera].targetTxtX=0;
      // vrat na pozici
    for(int i = 0;i<button.length;i++){
      
      if(i!=_ktera){
        
        button[i].rozbaleno=false;

      }
      // print(i+" = "+button[i].rozbaleno+"  ");

    } 
    //print("\n");
  }


  posledni = _ktera;


  for(int i = button.length-1;i>_ktera;i--){
    button[i].target=button[i].startY+posun;
    //button[i].targetTxtX=30.0;
      
  } 
  



}

void nadpis(String _nadpis){
 textFont(fontNadpis);
 fill(#3399CC,200);
 text(_nadpis,15,45); 
    
}

void superLine(){
 stroke(255,15);
  line(mouseX,0,mouseX,height);
   line(0,mouseY,width,mouseY); 
  
}

void keyPressed(){
 if(keyCode == ENTER){
  save("screen.png");
 } 
  
  
}

void anima(float _x,float _y){
  
  
  aktivniCheck[1]=aktivni;
 
  if((aktivniCheck[1])&&(!aktivniCheck[0])){
   doAnimFadeOut(); 
  } else if((!aktivniCheck[1])&&(aktivniCheck[0])){
    doAnimFadeIn();
  }
 
 
 aktivniCheck[0]=aktivni;
 
 

if(abs(animAlpha-animAlphaTarget)>3.0){
  animAlpha += (animAlphaTarget-animAlpha)/10.0;
fading=true;
} else {
fading = false;
animAlpha=animAlphaTarget;
}
  
 if((!aktivni)||(fading)){
  pushMatrix();
 translate(_x,_y);
 
 tint(#3399CC,map(animAlpha,0.0,255.0,0.0,155.0));
 image(zalozkaSleep,-zalozkaSleep.width+21,-_y-9);
 noTint();
 
 tint(255,map(animAlpha,0.0,255.0,0.0,155.0));
 image(shadeTimer,-zalozkaSleep.width+21,-_y);

 
  pushMatrix();
translate(anim.width/2,anim.height/2);
rotate(radians((frameCount/30.0)*360.0));
translate(-anim.width/2,-anim.height/2);


 image(anim,0,0);
 noTint();

 popMatrix(); 


 
fill(#3399CC,constrain(animAlpha-50,0,255));
textAlign(RIGHT);
textFont(sys);
 
text("sleep mode",-3,16);

textAlign(LEFT);

popMatrix();
/*fill(0,map(255-animAlpha,0,255,0,155));
rect(0,0,width,height);*/
 }
 
 

}

void doAnimFadeIn(){
  animAlphaTarget=255.0;
  
}

void doAnimFadeOut(){
  animAlphaTarget=0.0;
  
}



void nastevnost(){
  
  if((abs(pmouseX-mouseX)>0)||(abs(pmouseY-mouseY)>0)){
     noMove = 0;waiting=0;aktivni=true;
  }
  
  
  if(!fading){
  if((pmouseX-mouseX==0)&&(pmouseX-mouseX==0)){
    waiting+=1;
    if(waiting>1000000){waiting=151;}
    
    checkSEC[1]=(int) second();
    
   if((checkSEC[0]!=checkSEC[1])&&(waiting>150)){
     noMove+=1;
  
 }
  checkSEC[0]=(int) second();
  
  
}
   
   
  if(noMove==timer){
   goToSleep();    
  }
    wakeUp();
  }

}

void goToSleep(){
  if(aktivni){
    //println("spim jak dudek!");
     aktivni=false;
     
      for(int i =0;i<button.length;i++){
 
   button[i].reset();
  }
    
  }
  
  
}

void wakeUp(){
 if(!aktivni){
  if((abs(pmouseX-mouseX)>0)||(abs(pmouseY-mouseY)>0)){
     noMove = 0;checkSEC[1]=checkSEC[1]=(int)second();waiting=0;aktivni=true;
     pocetNavstev+=1;
    
     //saveStrings("/data/noVisited.txt",interrupt);
     
   } 
 }
  
}



