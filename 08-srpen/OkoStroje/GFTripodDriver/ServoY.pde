class ServoY{
  int uhel = 50;

  ServoY(){

  }

  void rot(int kolik){
    kolik=(int)map(kolik,0,255,47,180);
    tripod.send(kolik+"s"); 
  }

}
