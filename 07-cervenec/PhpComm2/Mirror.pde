public class Mirror{

  PhpCom p,I;
  String request ="";
  String displayPath ="/";
  String pathToScript;
  String scriptFN = "";
  String root;
  String[] childs;
  String[] tour = new String[1];
  String[] textToDisplay;
  String ext  = "";
  PImage img;
   int Dtype;
  PApplet par;
  int level;

  boolean ready = false,displayingText = false;
  
  color[] c ={#000000,#FCFCFC,#FFCC11};
   
  Mirror(PApplet _par,String _pathToScript,String _scriptFN,String _root){
    par=_par;
    pathToScript = _pathToScript;
    scriptFN = _scriptFN;
    img = createImage(1,1,ARGB);
    //-------------------------- New Communicators >>  
    p = new PhpCom(par,pathToScript+scriptFN);
    I = new PhpCom(par,pathToScript+"image.php");
    
    level=0;
    root = _root;
    tour[0]=""+root;
    p.getData(root);
    childs = p.List;
    

  }

  void viz(){
    if(p.ready()){
      if(displayingText){
        fill(c[1]);
        int lngh = textToDisplay.length;
        lngh = constrain(lngh,0,28);
        for(int i =0;i<lngh;i++){
         
       text(textToDisplay[i],width/3+10,20+i*10); 
        }
      }else{
        if((img.width>width/3*2-20)||(img.height>height-30)){
      image(img,width/3+10,10,width/3*2-20,height-30);
      }else{
         image(img,width/3+10,10);
      }
      }
      fill(c[1],100);
      text("miniGuide by Kof",width-80,height-5);
      text(displayPath,10,10);
      
      stroke(c[1],128);
          line(width/3,2,width/3,height-2);
          noStroke();
      
      int y = mouseY;
      for(int i = 0;i<childs.length;i++){
        if(isItFile(getNameOfChild(i))){fill(c[2]);}else{
        fill(c[1]);
        }
        text(cleanFilename(childs[i]),10,20+i*10); 
        //text(childs[i],10,20+i*10); 
        if(abs(y-(20+i*10))<5){
          fill(c[1],25);
          rect(0,22+i*10,width/3,-10);
          
          rooting(i);

        }
      } 
    }else{
      fill(0,100);
     text("Unable to get server-side file structure!\n\n Please try again later...",17,12);
    text("miniGuide by Kof",width-80,height-5); 
    }
  }

  String getNameOfChild(int _which){
    return childs[_which];

  }

  void rooting(int signal){
   // if(isItFile(getNameOfChild(signal))){println("file" + getNameOfChild(signal));}
    if((mousePressed)&&(!isItFile(getNameOfChild(signal)))){
      mousePressed=false;
      if((!getNameOfChild(signal).equals("."))&&(!getNameOfChild(signal).equals(".."))){
        level++;
        tour=expand(tour,tour.length+1);
        tour[level] = getNameOfChild(signal);
        request = join(tour,"/");
      }
      else if((getNameOfChild(signal).equals(".."))&&(level!=0)){

        tour[level] = tour[constrain(level-1,0,1024)];
        level--;
        tour=subset(tour,0,tour.length-1);
        request = join(tour,"/");
      } 
      else if(getNameOfChild(signal).equals(".")){
        tour=subset(tour,0,1);
        level=0;
        request=root; 
      }
      else{
        //---------- pro jistotu >>
        level=0;
        request=root;
      }
      
      
      
      //-------------------------------- Level debugger >>
      // println("level "+level); 
      // println(request);
      
      p.getData(request);
      childs = p.List;

      //---------------------- uprava zobr. cesty v rootu >>
      if(level!=0){
        displayPath = "/"+join(subset(tour,1,tour.length-1),"/");
      }
      else{
        displayPath = "/";
      }
      
    }else if((mousePressed)&&(isItFile(getNameOfChild(signal)))){
      
      //---------------------- ziskej priponu  >>
    ext = getFileExtension(getNameOfChild(signal));
     //---------------------- povoleny soubor? 1=txt 2=jpg..  >>
    Dtype = getDataType(ext);
   
    if(Dtype==1){
    textToDisplay = loadStrings(pathToScript+(join(tour,"/"))+"/"+cleanFilename(getNameOfChild(signal)));
     displayingText = true; 
  
    } else if(Dtype==2){
    img = loadImage(pathToScript+(join(tour,"/"))+"/"+cleanFilename(getNameOfChild(signal)));
    //I.sendDataToShow(pathToScript+(join(tour,"/"))+"/"+cleanFilename(getNameOfChild(signal)));
    I.sendDataToShow("./"+(join(tour,"/"))+"/"+cleanFilename(getNameOfChild(signal)));
    //println("./"+(join(tour,"/"))+"/"+cleanFilename(getNameOfChild(signal)));\\
    displayingText = false;
    
    } else {
    println("unsupported fileformat");
    }    
    
    mousePressed=false;
   
    }

  }

boolean isItFile(String s){
  boolean bool = false;
  if(s.charAt(0)=='~'){
    bool=true;
  }
  return bool;
}

String cleanFilename(String _fn){
  String fn = "";
  if(isItFile(_fn)){
  for(int i = 1;i<_fn.length();i++){   
    fn+=""+_fn.charAt(i);    
  }
  }else {
  fn=_fn;
  }
  return fn;
}

String getFileExtension(String _fn){
 String[] ext;
 ext = split(_fn,'.');
 //println("ext: "+ext[1]);
  return ext[1];
}

int getDataType(String _ext){
 int bck = 0;
 
 if(_ext.equals("txt")||_ext.equals("doc")||_ext.equals("html")||_ext.equals("pde")||_ext.equals("java")){
  bck = 1;
 } 
 else if(_ext.equals("jpg")||_ext.equals("png")||_ext.equals("bmp")||_ext.equals("gif")){
  bck = 2; 
 }
 
 return bck;
}

}
