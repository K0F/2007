Bod[] bod = new Bod[320*320];
byte[] data= new byte[320*320];
void setup(){
  size(320,320,P3D);
  background(0);  
  for(int x = 0;x<width;x++){
    for(int y = 0;y<height;y++){
      bod[y*width+x]=new Bod(x,y);
    }

  }

}

void draw(){

  for(int x = 0;x<width;x++){
    for(int y = 0;y<height;y++){
      bod[y*width+x]._draw(color(random(200)));
      data[y*width+x]=byte(color(random(200)));
      
    }

  }
if(keyPressed){
       
        saveMe(data); 
      }
}

void saveMe(byte[] _data){
 saveBytes("dat.kof",_data);
keyPressed=false; 
  println("saved");
}

class Bod{
  int x,y; 
   color c;
  Bod(int _x,int _y){
    x=_x;
    y=_y; 
  }

  void _draw(color _c){
   
    c=_c;
    set(x,y,c); 
  }
}
