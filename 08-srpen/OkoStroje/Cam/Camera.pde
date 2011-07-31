public class Camera{
  JMyron c;
  int w,h;
  int[] tmp;
  int[] obraz;
  color clr;
  int res;

  Camera(int _w,int _h,int _res){
    w=_w;
    h=_h;
    res=_res;

    c=  new JMyron();
    c.start(w,h);
    c.findGlobs(0);

    strokeWeight(res);

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
    obraz = imag();
    for(int x = 0;x<c.width();x+=res){
      for(int y = 0;y<c.height();y+=res){
        clr=color(obraz[y*c.width()+x]);
        
        fill(clr);
        rect(x,y,res,res);
      }

    } 



  }





}
