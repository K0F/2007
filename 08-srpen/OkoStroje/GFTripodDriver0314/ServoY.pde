class ServoY{
  int uhel = 120;

  ServoY(){

  }

  void send(int kolik){
    uhel = kolik;
    String command = "";
    uhel=constrain(uhel,50,180);
    command = str(uhel)+" ";
    tripod.send("y "+command); 
  }
  
}
