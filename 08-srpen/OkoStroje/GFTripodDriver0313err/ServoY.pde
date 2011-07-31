class ServoY{
  int uhel = 120;

  ServoY(){

  }

  void send(int kolik){
    String command = "";
    kolik=constrain(kolik,50,180);
    command = str(kolik)+" ";
    tripod.send("y "+command); 
  }
  
}
