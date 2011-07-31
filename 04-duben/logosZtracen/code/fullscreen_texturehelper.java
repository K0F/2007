package processing.core; 
import processing.core.*; 
import processing.opengl.*; 

/**
 * Opengl tends to erase textures when grabbing/releasing exclusive fullscreen
 * mode. So this class here helps to update the textures (if in opengl mode)
 * 
 * Why does this extend PGraphics3D? Because we need 
 * access to a protected variable, so 
 */

public class fullscreen_texturehelper{
  
  public static void update( PApplet dad ){
    // Now, if in opengl mode all the textures will be erased, 
    // we'll have to call updatePixels() on all of them! 
    // Oh, and we have to use reflection, because we don't know if 
    // opengl is being used. So the class names might not even be there. 
    if( dad.g.getClass().getName().equals( "processing.opengl.PGraphicsOpenGL" ) ){
      try{
        PImage textures[] = null; 
        textures = (PImage[]) PGraphics3D.class.getDeclaredField( "textures" ).get( dad.g ); 
        for( int i = 0; i < textures.length; i++ ){
          if( textures[ i ] != null ){
            textures[ i ].updatePixels(); 
          }
        }
      }
      catch( Exception e ){
        System.err.println( "FullScreen API: Failed to update textures!" ); 
        e.printStackTrace(); 
      }
    }
  }
}