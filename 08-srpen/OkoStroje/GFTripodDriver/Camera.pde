import JMyron.*;

public class Camera{
  JMyron c;
  int w,h;
  int[] tmp;
  int[] obraz;
  color clr;
  int res;


  /**
   * some sensors
   */
  Senzor s1;


  Camera(int _w,int _h,int _res,int tresh){
    w=_w;
    h=_h;
    res=_res;

    c=  new JMyron();
    c.start(w,h);
    c.findGlobs(0);

    strokeWeight(res);

    s1 = new Senzor(width/2,height/2,tresh);

  }

  void rozliseni(int _res){
    _res=(int)map(constrain(_res,1,width),1,width,1,10);
    res=_res;

  }

  int[] imag(){
    c.update();
    tmp = c.image();
    return tmp;
  }

  void viz(){
    noStroke();
    obraz = imag();
    for(int x = 0;x<c.width();x+=res){
      for(int y = 0;y<c.height();y+=res){
        clr=(int)brightness(obraz[y*c.width()+x]);
        if((s1.sudden(clr))&&(x==s1.x/10)&&(y==s1.y/10)){
          //println("hit!");
          fill(255,55,55);
          rect(s1.x-10,s1.y-10,width/40,height/40);
          s1.lval = clr;
        }
        fill(clr);
        rect(map(x,0,c.width(),0,width),map(y,0,c.height(),0,height),width/40,height/40);
      }

    }





  }





}
