PImage backage,frontage;
 Color c ;
int cnt;
 Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
void setup(){
  colorMode(ARGB);
  
  java.lang.System.setProperty("sun.java2d.noddraw","true");
 backage = loadImage("backage.png");
  frontage = loadImage("frontage.png");
   size(backage.width,backage.height);
 this.frame.setUndecorated(true);
 c = new Color(0x00FFFFFF ,true);
this.frame.setBackground(c);

 this.frame.setTitle("ten years on the moon");
this.frame.setAlwaysOnTop(true);

 // image(backage,0,0);





}

void draw(){
   cnt++;
  image(frontage,sin(cnt/10.0)*10.0,0);
  

}


