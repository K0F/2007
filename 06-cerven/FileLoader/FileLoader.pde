String[] raw;
String address;

void setup(){
  size(200,300);  
  init();
  background(0);
  fill(255);
 
   address =""+getCodeBase();//"http://weirdplace.wz.cz/write/";
  
  
  
  refresh(address,"data.txt");

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
 
 refresh(address,"data.txt");
keyPressed=false;
}

public void refresh(String url,String _fileName){

  try{
    raw=null;
    raw=loadStrings(url+_fileName); 
    System.out.println("Data loaded sucessfully! url:"+url+_fileName) ;

  }
  catch(Exception e){
    System.out.println("Error while loading file: "+e) ;
    raw=null;
    raw[0]=new String();
    raw[0]="no data were found !";
  } 


}




