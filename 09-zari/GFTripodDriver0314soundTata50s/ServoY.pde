class ServoY{
  int uhel = 120;

  ServoY(){

  }

  void send(int kolik){
    uhel = kolik;
    String command = "";
    
    uhel=constrain(uhel,114,140); //limitace v uhlu
    command = str(uhel)+" ";
    tripod.send("y "+command); 
  }
  
}
