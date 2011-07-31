import java.awt.datatransfer.*;
 
PFont dFont;
ClipHelper cp = new ClipHelper();
 
boolean[] keys = new boolean[526];
boolean checkKey(String k)
{
  for(int i = 0; i < keys.length; i++)
    if(KeyEvent.getKeyText(i).toLowerCase().equals(k.toLowerCase())) return keys[i];  
  return false;
}
 
void setup()
{
  size(500,400);
  dFont = loadFont("Uni0553-8.vlw");
  textFont(dFont,12);
  background(0);
}
 
void draw()
{
}
 
void keyPressed()
{ keys[keyCode] = true;
  if(checkKey("ctrl") && checkKey("v")) background(Integer.parseInt(cp.pasteString()));
  if(checkKey("ctrl") && checkKey("c")) cp.copyString(""+(int)random(255));
}
 
void keyReleased()
{ keys[keyCode] = false; }
