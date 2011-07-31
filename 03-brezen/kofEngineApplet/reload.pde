void reload(){
try{
  root = loadStrings("http://weirdplace.wz.cz/kofEngineActual.txt");
  try{
    Thread.sleep(120);}catch(InterruptedException r){
     System.out.println("root found"); 
    }
  frameLabel = loadStrings("http://weirdplace.wz.cz/"+root[0]+"/frame/frameLabel.txt");

  String path = ("http://weirdplace.wz.cz/"+root[0]+"/frame/icon16.gif"); 
    
  byte[] b = loadBytes(path);
  Image img = getToolkit().createImage(b);
  frame.setIconImage(img);
  frame.setTitle(frameLabel[0]);
  frame.show();

  font = loadFont("http://weirdplace.wz.cz/"+root[0]+"/font.vlw");
  textFont(font);
  background(0);
  //----------------------------------------------------------------------> main
  msk = loadImage("http://weirdplace.wz.cz/"+root[0]+"/mask.jpg");
  front = loadImage("http://weirdplace.wz.cz/"+root[0]+"/front.jpg");
  back = loadImage("http://weirdplace.wz.cz/"+root[0]+"/back.jpg");
  lines= loadStrings("http://weirdplace.wz.cz/"+root[0]+"/text.txt");
  front.mask(msk);
  //---------------------------------------------------------------------->read commands
  numPages = loadStrings("http://weirdplace.wz.cz/"+root[0]+"/images/commands.txt");
  //----------------------------------------------------------------------> main
  namePrefix = numPages[0];
  PGS = Integer.parseInt(numPages[1].substring(0,4));
  piece = new PImage[PGS+1];
  for(int i = 1;i<=PGS;i++){
    piece[i] = loadImage("http://weirdplace.wz.cz/"+root[0]+"/images/"+namePrefix+""+i+".jpg");
    println(i+".jpg  loaded");
  }
}catch(Exception e){
 System.out.println("did not load succesfully! beause of error:" + e); 
}

  if (lines==null){
    text("connection problem occured",10,20);
  }


  page=0;



}
