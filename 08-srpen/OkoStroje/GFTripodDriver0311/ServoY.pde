class ServoY{
  int uhel = 50;

  ServoY(){

  }

  void send(int kolik){
    kolik=(int)map(kolik,0,255,47,180);
    tripod.send(kolik+"s"); 
  }
  
  void send(String co){
    tripod.send(co); 
  }

}
