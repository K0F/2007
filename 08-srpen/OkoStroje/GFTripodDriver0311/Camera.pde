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

  Senzor[] s;
  
  Camera(int _w,int _h,int tresh){
    w=_w;
    h=_h;
    //res=_res;

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
        which = y*w+x;
        clr=(int)brightness(obraz[which]);
        
        //----------- preview ! >
        fill(clr);
        rect(map(x,0,c.width(),0,width),map(y,0,c.height(),0,height),width/w,height/h);
        //----------- analyze ! >
        if(s[which].sudden(clr)){
          //println("hit!");
          fill(#FF1111);
          rect(map(s[which].x,0,w,0,width),map(s[which].y,0,h,0,height),width/w,height/h);
          s[which].lval = clr;
          Bcount += 1;
        }// END IF
        
      }//END Y

    }//END X

  }//END void VIZ

}
