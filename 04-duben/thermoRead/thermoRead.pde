
//"thermo_"+(int)day()+"-"+(int)month()+"_"+(int)year()+".png"

PImage[] img = new PImage[3];
PFont font;
int[] qant = new int[2];
int[] soucet = new int[2];
int[] prum = new int[2];

void setup(){
  size(1000,255);
  frameRate(40);
  customizeCursor("/imgs/thermoCrsr.gif");
  imgar("/thermostation/thermo_"+(int)day()+"-"+(int)month()+"_"+(int)year()+".png",0);
  imgar("/thermostation/thermo_"+((int)day()-1)+"-"+(int)month()+"_"+(int)year()+".png",1);
   imgar("/imgs/mbo.png",2);
  font = loadFont("Uni0553-8.vlw");
  textFont(font);

}

void draw(){
qant[0] = 0;
soucet[0] = 0;
prum[0] = 0;
qant[1] = 0;
soucet[1] = 0;
prum[1] = 0;

 for(int i =15;i<height;i++){
  if(brightness(img[0].get(mouseX-2,i))>200){qant[0]+=1;soucet[0]+=i;}
  if(brightness(img[1].get(mouseX-2,i))>200){qant[1]+=1;soucet[1]+=i;}
}

  image(img[0],0,0);
  
 
prum[0] = int(soucet[0]/(qant[0]+0.01));
prum[1] = int(soucet[1]/(qant[1]+0.01));

 tint(255,255,15,55);
  image(img[1],0,0);
  noTint();
  stroke(255,70);
  line(mouseX-2,15,mouseX-2,height);
  
  line(0,prum[0],width,prum[0]);
  stroke(255,255,15,55);
 line(0,prum[1],width,prum[1]);
   fill(255);
  String q =""+(int)(map(mouseX-2,0,width/24.0,0,60))%60;if(Integer.parseInt(q)<10){q = "0"+q;}
  String teplotas = round(map(prum[0],height,0.0,0.0,24.5)*100.0)/100.0+"°C";
  String teplotasY = "("+round(map(prum[1],height,0.0,0.0,24.5)*100.0)/100.0+"°C )";
  String zn = "";
  if(prum[0]<prum[1]){zn = "+";}else if(prum[0]>prum[1]){zn = "-";}
  
  float rozdil = round(abs((map(prum[0],height,0.0,0.0,24.5))-(map(prum[1],height,0.0,0.0,24.5)))*10.0)/10.0;
  
  if(qant[0] == 0){teplotas = "no data";rozdil = 0;zn = "";}
 
  text(int(map(mouseX-2,0,width,0,1440)/60)+":"+q+"\n"+teplotas+"   "+"("+zn+rozdil+"°C)",mouseX+5,mouseY+10);
  
   fill(255,255,15,55);
   //text
   fill(255);
 image(img[2], width-135,height-100);
  text("temperature today",width-130,height-30);
  fill(255,255,15,55);
  text("temperature yesterday",width-130,height-20);
  
}



void mouseReleased(){

  this.setup() ;

}


void imgar(String path,int which) {

  Toolkit toolkit = getToolkit();
  Image ia;


  byte[] q = loadBytes(path);
  ia = getToolkit().createImage(q);


  if (ia != null) {

    try {

      img[which] = loadImageSync(ia);

    }
    
    catch(Exception exc) {
      System.err.println("Unable to create an image..");
    
  }

  }

}

