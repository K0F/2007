import JMyron.*;

public class Camera{
  JMyron c;
  int w,h;
  int[] tmp;
  int[] obraz;
  color clr;
  int res = 1;
  int numOfS = 1;
  int which; 
  int Bcount = 0;
  float destinationX,destinationY;
  float avgX,avgY;
  float speed = 5.0f;
  float targetX,targetY;
  
  
  Senzor[] s;
  Sound snd;
  
  Camera(int _w,int _h,int tresh,float _speed,PApplet parent){
    w=_w;
    h=_h;
    speed=_speed;
    
    
    c = new JMyron();
    c.start(w,h);
    c.findGlobs(0);
    

    // ------------------ senzory >
    numOfS = w*h;
    s = new Senzor[numOfS];
    
    for(int x = 0;x<w;x++){
      for(int y = 0;y<h;y++){
        s[y*w+x] = new Senzor(x,y,y*w+x,tresh);
      }
    }
    
    snd = new Sound(parent,55,w); //
    
    destinationX = width/2;
    destinationY = height/2;
       avgX=destinationX;
        avgY=destinationY; 
       targetX=avgX;
      targetY=avgY; 
}


  int[] imag(){
    c.update();
    tmp = c.image();
    return tmp;
  }

  void viz(){
    noStroke();

    obraz = imag();
   stroke(0);
    
    for(int x = 0;x<w;x+=1){
           
        if(automata){
        snd.sndAnalyze(clr,x);       
        }
      
      for(int y = 0;y<h;y+=1){
        which = y*w+(x);  // bez zrcadleni
        clr=(int)brightness(obraz[which]);
        
        //----------- preview ! >
        fill(clr);
        rect(map(x,0,w,width,0),map(y,0,h,0,height),width/w,height/h); // zrcadlo
        //----------- analyze ! >
        if(s[which].sudden(clr)){
          s[which].hit=true;
          fill(#FF1111);
          rect(map(s[which].x,0,w,width,0),map(s[which].y,0,h,0,height),width/w,height/h); // zracdlo
          s[which].lval = clr;
          
        }// END IF
        
      }//END Y

    }//END X
    snd.cntr=0;
    avgX=0;avgY=0;
     Bcount = 0;
     targetX=(width/2);
     targetY=(height/2);
     
    for(int i = 0; i < numOfS ; i++){
     if(s[i].hit){
      avgX += map(s[i].x,0,w,-width/2,width/2);
      avgY += map(s[i].y,0,h,-height/2,height/2);
      Bcount += 1;
      s[i].hit=false;
     } 
    }
        
    targetX += (avgX)/(Bcount+0.1f);
    targetY += (avgY)/(Bcount+0.1f);
       
    destinationX += (targetX-destinationX)/speed;
    destinationY += (targetY-destinationY)/speed;
    
    stroke(255);
    line(0,destinationY,width,destinationY);
    line(destinationX,0,destinationX,height);
    noStroke();
    
  }//END void VIZ

}
