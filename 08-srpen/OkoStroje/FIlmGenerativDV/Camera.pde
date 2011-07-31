import JMyron.*;

public class Camera{
  JMyron c;
  int w,h;
  int[] tmp;
  int[] obraz;
  color clr;
  int res;
  

  /**
  some sensors
  */
  Senzor s1;
  /**
  some scriptWriter
  */
  ScriptWriter sc;
  
  Camera(int _w,int _h,int _res,int tresh){
    w=_w;
    h=_h;
    res=_res;

    c=  new JMyron();
    c.start(w,h);
    c.findGlobs(0);

    strokeWeight(res);
    
    s1 = new Senzor(width/2,height/2,tresh);
    sc = new ScriptWriter("script");  
  }

  void rozliseni(int _res){
    _res=(int)map(constrain(_res,1,width),1,width,1,10);
    res=_res;
    strokeWeight(res);
  }

  int[] imag(){
    c.update();
    tmp = c.image();
    return tmp;
  }

  void viz(){
    noFill();
    obraz = imag();
    for(int x = 0;x<c.width();x+=res){
      for(int y = 0;y<c.height();y+=res){
        clr=(int)brightness(obraz[y*c.width()+x]);
        if((s1.sudden(clr))&&(x==s1.x)&&(y==s1.y)){
          fill(255,55,55);
          noStroke();
         rect(x-2,y-2,2,2);
         sc.insert(frameCount,clr);
        }
        stroke(clr);
        line(x,y,x+res,y);
      }

    }
   
   



  }





}
