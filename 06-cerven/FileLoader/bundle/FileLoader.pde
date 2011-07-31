String[] raw;
String path;

void setup(){
  size(200,300);  
  background(0);
  fill(255);

  refresh("data.txt");

  PFont font = loadFont("00Acrobatix-8.vlw");
  textFont(font);
  textMode(SCREEN);

}

void draw(){
  background(0);
  fill(255);

  if(raw!=null){
    for(int i = 0;i<raw.length;i++){
      text(raw[i],10,10+(i*10),width-20,height-20);
    }
  }  

}
public void keyPressed(){
 refresh("data.txt");
keyPressed=false;
}

public void refresh(String _fileName){

  try{
    raw=loadStrings(_fileName); 
    System.out.println("Data loaded sucessfully!") ;

  }
  catch(Exception e){
    System.out.println("Error while loading file: "+e) ;
    raw=null;
    raw[0]=new String();
    raw[0]="no data were found !";
  } 


}




