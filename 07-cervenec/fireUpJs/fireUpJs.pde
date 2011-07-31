
import netscape.javascript.*;
 
void setup () {
    size( 200, 200 );
}
 
void draw () {
    //  
    // from 30 down to one line ... that's processing.
    //
   
    runSctript();
    noLoop();
} 

void runSctript(){
 if(online){
   JSObject.getWindow(this).eval( "var script = document.createElement('script'); ");
   JSObject.getWindow(this).eval( "script.type = 'text/javascript'; ");
   JSObject.getWindow(this).eval( "script.src = 'skript.js'; "); 
   JSObject.getWindow(this).eval("document.getElementsByTagName('head')[0].appendChild(script);  ");



    } 
  
  
}
