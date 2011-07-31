FTPClient ftp; 
PFont font;
String root[],lines[],frameLabel[],numPages[],namePrefix; 
PImage back,front,msk;
PImage[] piece;
int page = 0,PGS;

int cnt;
boolean reconnect = false;
void setup(){
  size(200,320);
  frameRate(50);
  reload();  
}

void draw(){

  if(page!=0){
    renderImage(page);
  }
  else{

    if(reconnect){
      reconnecting();

    }
    else{
      image(back,0,0);
      for (int i=0; i < lines.length; i++) {
        /*String singleline = lines[i]+"";
         println(singleline);
         char weird = singleline.charAt(2);
         if(weird=='*'){fill(255,0,0);}else{fill(255);}*/
        fill(255,220-((sin(cnt/10.0)+1)*20));
        text(lines[i],17,(i*8)+20);
      }
      tint((sin(cnt/30.0)+1)*255);
      image(front,0,0);
      noTint();
      cnt++;
      fill((sin(cnt/10.0)+1)*255);
      rect(width-10,height-10,5,5); 
    }
  }
  reconnect = false;
}


