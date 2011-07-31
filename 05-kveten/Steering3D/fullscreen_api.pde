

Frame fsFrame = new Frame(); 
GraphicsDevice fsDevice = fsFrame.getGraphicsConfiguration().getDevice(); 

int fsResolutionX, fsResolutionY; 


boolean fsIsInitialized; 


boolean fsBindKeys; 


{
  fsFrame.setTitle( "CAR" ); 
  fsFrame.setUndecorated( true ); 
  fsFrame.setBackground( Color.black ); 
  fsFrame.setLayout( null ); 
  fsFrame.addWindowListener( new FSWindowListener() );
  fsFrame.setSize( fsDevice.getDisplayMode().getWidth(), fsDevice.getDisplayMode().getHeight() ); 
}



boolean isFullScreen(){
  return fsDevice.getFullScreenWindow() == fsFrame; 

}



boolean isFullScreenAvailable(){
  return frame != null;
}


boolean setFullScreen( boolean fullScreen ){

  // If it's called from setup we wait until the applet initialized properly
  if( frameCount == 0 && fullScreen == true ){
    new FSWaitForInitThread().start(); 

    return true; 
  }





  if( fullScreen == isFullScreen() ){

    return true; 
  }
  else if( fullScreen ){


    if( isFullScreenAvailable() ){
      fsDevice.setFullScreenWindow( fsFrame ); 


      frame.removeAll(); 
      frame.setVisible( false ); 
      frame.setSize( width + frame.insets().left + frame.insets().right, 
      height + frame.insets().top + frame.insets().bottom ); 
      fsFrame.add( this ); 
      this.requestFocus(); 

      setResolution( 0, 0 ); 

      return true; 
    }
    else{
      System.err.println( "Fullscreen mode not available" ); 
      return false; 
    }
  }
  else{  
    fsFrame.removeAll(); 
    frame.add( this ); 
    this.setLocation( frame.insets().left, frame.insets().top ); 
    this.requestFocus(); 

    fsDevice.setFullScreenWindow( null ); 
    fsFrame.setVisible( false ); 

    frame.setVisible( true ); 

    return true; 
  }
}
boolean setResolution( int xRes, int yRes ){
  if( xRes > 0 && yRes > 0 ){
    fsResolutionX = xRes; 
    fsResolutionY = yRes; 
  } 

  if( !isFullScreen() ){
    return false; 
  }

  if( fsResolutionX <= 0 || fsResolutionY <= 0 ){
    setLocation( ( fsDevice.getDisplayMode().getWidth() - width ) / 2, ( fsDevice.getDisplayMode().getHeight() - height ) / 2 ); 
    return false; 
  }  
  DisplayMode modes[ ] = fsDevice.getDisplayModes(); 
  DisplayMode theMode = null; 

  for( int i = 0; i < modes.length; i++ ){
    if( modes[ i ].getWidth() == fsResolutionX && modes[ i ].getHeight() == fsResolutionY ){
      theMode = modes[ i ]; 
    }
  }
  if( theMode == null ){
    System.err.println( "Display mode not supported: " + fsResolutionX + "x" + fsResolutionY ); 
    setLocation( ( fsDevice.getDisplayMode().getWidth() - width ) / 2, ( fsDevice.getDisplayMode().getHeight() - height ) / 2 ); 
    return false; 
  }
  try{
    fsDevice.setDisplayMode( theMode ); 
    fsFrame.setSize( fsResolutionX, fsResolutionY ); 
  }
  catch( Exception e ){
    System.err.println( "Failed to go to fullScreen mode" ); 
    e.printStackTrace(); 
    return false; 
  }
  setLocation( ( fsDevice.getDisplayMode().getWidth() - width ) / 2, ( fsDevice.getDisplayMode().getHeight() - height ) / 2 ); 
  return true; 
}
void createFullScreenKeyBindings(){
  fsBindKeys = true; 
}

final static int fsControlKey = Toolkit.getDefaultToolkit().getMenuShortcutKeyMask();
public void processKeyEvent( KeyEvent e ){

  if( fsBindKeys == false ){
    super.processKeyEvent( e ); 
  }
  else if( e.getKeyCode() == e.VK_ESCAPE ){
    if( isFullScreen() ){
      if( e.getID() == KeyEvent.KEY_RELEASED ){
        setFullScreen( false ); 
      }
    }
    else{
      super.processKeyEvent( e ); 
    }
  }

  else if( e.getID() == KeyEvent.KEY_PRESSED ){
    if( ( e.getKeyCode() == e.VK_F && e.getModifiers() == fsControlKey ) ||
      ( platform == WINDOWS && e.getKeyCode() == e.VK_ENTER && e.getModifiers() == e.VK_ALT ) ){
      setFullScreen( !isFullScreen() ); 
    }
    else{
      super.processKeyEvent( e ); 
    }
  }
  else{
    super.processKeyEvent( e ); 
  }
}

class FSWindowListener extends WindowAdapter{
  public void windowClosing( WindowEvent e ){
    // let processing exit! 
    exit(); 
  }
}

class FSWaitForInitThread extends Thread{

  public void run(){
    while( frameCount < 5 ){
      try{
        Thread.sleep( 1000 ); 
      }
      catch( Exception e ){
        System.err.println( "failed to go to fullscreen mode" ); 
        return; 
      }
    }

    if( !setFullScreen( true ) ){
      System.err.println( "failed to go to fullscreen mode" );
    }
  }
}
