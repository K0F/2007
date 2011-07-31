

PFont font;

void setup(){
  String root = sketchPath+"";
 size(200,200);
 font= loadFont("FFFHarmony-8.vlw");
 textFont(font);
 fill(#FFFFFF);
 
 
 Color c = new Color(0,0,0,0);
  this.setBackground(c); 
 ProcessDirectory(root); 
 
 
}

void draw(){
  
  
}


public void ProcessDirectory(String addr) {
        File dir = new File(addr);
        File[] files = dir.listFiles();
        for (int i = 0; i < files.length; i++)
            text(files[i].toString(),10,10+i*12);
    }
    
 
