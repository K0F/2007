import processing.core.*; import processing.serial.*; import com.enterprisedt.net.ftp.test.*; import com.enterprisedt.util.debug.*; import com.enterprisedt.net.ftp.*; import java.applet.*; import java.awt.*; import java.awt.image.*; import java.awt.event.*; import java.io.*; import java.net.*; import java.text.*; import java.util.*; import java.util.zip.*; public class ard_thermo_read_beta_FTP extends PApplet {
Serial port;       
// The serial port

String[] ind = new String[5];
int[] changeH = new int[2];
int[] changeD = new int[2];
int res = 40*2;
int thisByte = -1;  // Variable to hold keystoke values
int whichKey = -1;  // Incoming serial data
float q;
int jj = 0;
int qant,soucet;
float prum;
PFont fontA;        // Font for printing
float cnt =0;
float minval = 255,maxval=0;
int val[] = new int[res+1];
float[] liner = new float[2] ;
 String[] nula = new String[1];


public void setup() {

  size(1000, 255);
  frameRate(25);
 
  nula[0] = str(0);
  //saveStrings(sketchPath+"/data/info.kof", nula);
  frame.setTitle("thermo ReaDer by kof");
  // Load and prep fonts to print to window
  setFullScreen( false );               // get fullscreen exclusive mode
    setResolution( 1024,768 );           // change resolution to 640, 480
    createFullScreenKeyBindings();       // let ctrl+f switch to window mode
      //-----------------------* frame icon
  String path = sketchPath("data/kofApp.gif"); 
  path.replace('\\','/');    
  Image img = getToolkit().getImage(path);
  frame.setIconImage(img);
  //-----------------------* frame title
  //-----------------------*
  fontA = loadFont("04b24-24.vlw");
  textFont(fontA, 8);
cursor(CROSS);
  // List all the available serial ports:
  println(Serial.list());

  // I know that the first port in the serial list on my mac
  // is always my  Keyspan adaptor, so I open Serial.list()[0].
  // In Windows, this usually opens COM1.
  // Open whatever port is the one you're using.
  port = new Serial(this, Serial.list()[2], 9600);

  // send a capital A out the serial port:
 
   println("");
   println("READY TO GO!");

  port.write(65);
background(0);
}



boolean first = true;

public void draw() {
  
  changeH[0] = (int)hour();
  changeD[0] = (int)day();
  
  float koef = (maxval-minval)/10.0f;
  
  cnt=map(  ( ( (int)hour()*60  )+((int)minute())),0.0f,1440.0f,0,width);
  qant+=1;if(qant>res){qant=0;}
// if(cnt>=width){cnt=0;savePicture();background(0);}
  
  noStroke();
  val[qant] = thisByte;
liner[0] = prum;
soucet = 0;  
 
  int kk = 0;
  for (int i =0;i<res;i++){
  kk++;
    soucet += val[i]; 
 
  }
  
  
  prum = soucet/(kk+1.0f);
//println((prum*12.0));
  noSmooth();
  //----------------------------------- * hodina
  if((changeH[0] != changeH[1])&&(!first)) {stroke(255,20);fill(255,180);line(cnt,0,cnt,height);text(changeH[0],cnt+5,height-2);savePicture();}
  changeH[1] = (int)hour();
  
 //------------------------------------ * den
  if((changeD[0] != changeD[1])&&(!first)) {savePicture();background(0);saveStrings(sketchPath+"/data/info.kof", nula);}
  changeD[1] = (int)day();
  
  
  
  //----------------------------------- * render
  stroke(255,80);
  //println(liner[1]);
  point(cnt,map(liner[1],62.0f,130.0f,height-5.0f,5.0f));
  stroke(map(liner[0],62.0f,130.0f,0,255),35);
  line(cnt,0,cnt,10);
  liner[1]=prum;
  
  first=false;
  
  if (minval>=prum){minval = prum;}
  if (maxval<=prum){maxval = prum;}
  //println(liner[0]);
  
   
  while (port.available() > 0) {
    thisByte = PApplet.parseInt(port.read());
  }
}

public void keyPressed() {
  if(keyCode==ENTER){
savePicture();  
keyCode=0;

  } else if(keyCode == DELETE){
    keyCode=0;
    background(0);
  } else if(keyCode == BACKSPACE){
     keyCode=0;
   loadTemp(); 
    
  }
    
    
 keyPressed = false ;
 

 
}

public void savePicture(){
  ind=loadStrings(sketchPath+"/data/info.kof");
 int f = Integer.parseInt( ind[0] )+1;
 
  ind[0]= ""+f;
 ind[1]= ""+f;
  saveStrings(sketchPath+"/data/info.kof", ind);
   save(sketchPath+"/imgs/temp/"+f+".png");
 save(sketchPath+"/imgs/thermo_"+changeD[1]+"-"+(int)month()+"_"+(int)year()+".png");
   putFile("weirdplace.wz.cz","weirdplace.wz.cz","cigareta","imgs","thermostation","thermo_"+changeD[1]+"-"+(int)month()+"_"+(int)year()+".png","thermo_"+changeD[1]+"-"+(int)month()+"_"+(int)year()+".png"); 

}

public void loadTemp(){
  ind=loadStrings(sketchPath+"/data/info.kof");
  if(Integer.parseInt( ind[0] )!=0){
 PImage zaloha = loadImage(sketchPath+"/imgs/temp/"+constrain(Integer.parseInt( ind[1] ),1,1024)+".png");
 image(zaloha,0,0);
  } 
  
}


FTPClient ftp; 
String[] files;


  

//
  
  
  


public void putFile (String ftpp, String logn, String pass, String directoryH,String directoryR, String fileNameH,String fileNameR)
{

  try
  {


    ftp = new FTPClient();
    ftp.setRemoteHost("ftp://"+ftpp);

    FTPMessageCollector listener = new FTPMessageCollector();
    ftp.setMessageListener(listener);

    println ("Connecting");
    ftp.connect();

    println ("Logging in");
    ftp.login(logn,pass);

    println ("Setting up passive, ASCII transfers");
    ftp.setConnectMode(FTPConnectMode.PASV);
    ftp.setType(FTPTransferType.BINARY);


    println ("Putting file");
    ftp.put(sketchPath+"/"+directoryH+"/"+fileNameH, "/"+directoryR+"/"+fileNameR, false);

    println ("Directory after put");
    files = ftp.dir(".", true);
    for (int i = 0; i < files.length; i++)
    {
      println (i+" "+files[i]);
    }




    println ("Quitting client");
    ftp.quit();


    String messages = listener.getLog();
    println ("Listener log:");

    println(messages);
    println ("Test complete");

  }
  catch (Exception e)
  {

    println("Error "+e);

  }

}   

/**
 * FullScreen support for processing. 
 * 
 * For a detailed reference see http://www.superduper.org/processing/fullscreen_api/
 * 
 * - setFullScreen( true | false ) 
 *   goes to / leaves fullscreen mode
 *
 * - setResolution( x, y ) 
 *   sets the resolution 
 * 
 * - createFullScreenKeyBindings() 
 *   links ctrl+f (or apple+f for macintosh) to enter/leave fullscreen mode
 *
 * WARNING: This package conflicts with the processing "present" option. If you want
 * fullscreen from the start use like this: 
 * 
 * void setup(){
 *   setFullScreen( true );               // get fullscreen exclusive mode
 *   setResolution( 640, 480 );           // change resolution to 640, 480
 *   createFullScreenKeyBindings();       // let ctrl+f switch to window mode
 * }
 * 
 * LIMITATIONS: 
 * - The size of the sketch can not be changed, when your sketch is
 *   smaller than the screen it will be centered. 
 * - The ESC key exits the sketch, this is processing standard. 
 * - Requires min. Java 1.4 to be installed work
 * - Only works for applications (not for applets)
 * 
 * by hansi, http://www.superduper.org,  http://www.fabrica.it
 *
 */


// We use this frame to go to fullScreen mode...
Frame fsFrame = new Frame(); 
GraphicsDevice fsDevice = fsFrame.getGraphicsConfiguration().getDevice(); 
//AWTEventListener fsKeyListener;

// desired x/y resolution
int fsResolutionX, fsResolutionY; 

// the first time wait until the frame is displayed
boolean fsIsInitialized; 

// bind the keys? 
boolean fsBindKeys; 

// Setup everything...
{
  fsFrame.setTitle( "FullScreen" ); 
  fsFrame.setUndecorated( true ); 
  fsFrame.setBackground( Color.black ); 
  fsFrame.setLayout( null ); 
  fsFrame.addWindowListener( new FSWindowListener() );
  fsFrame.setSize( fsDevice.getDisplayMode().getWidth(), fsDevice.getDisplayMode().getHeight() ); 
}


/**
 * Are we in FullScreen mode? 
 *
 * @returns true if so, yes if not
 */
public boolean isFullScreen(){
  return fsDevice.getFullScreenWindow() == fsFrame; 
}


/**
 * FullScreen is only available is applications, not in applets! 
 *
 * @returns true if fullScreen mode is available
 */
public boolean isFullScreenAvailable(){
  return frame != null;
}

  
/**
 * Enters/Leaves fullScreen mode. 
 *
 * @param fullScreen true or false
 * @returns true on success
 */
public boolean setFullScreen( boolean fullScreen ){
  
  // If it's called from setup we wait until the applet initialized properly
  if( frameCount == 0 && fullScreen == true ){
    new FSWaitForInitThread().start(); 
    
    return true; 
  }
  
  
  
  
  
  if( fullScreen == isFullScreen() ){
    // no change required! 
    return true; 
  }
  else if( fullScreen ){
    // go to fullScreen mode...
    
    if( isFullScreenAvailable() ){
      fsDevice.setFullScreenWindow( fsFrame ); 
      
      // remove applet from processing frame and attach to fsFrame
      frame.removeAll(); 
      frame.setVisible( false ); 
      frame.setSize( width + frame.insets().left + frame.insets().right, 
                     height + frame.insets().top + frame.insets().bottom ); 
      fsFrame.add( this ); 
      this.requestFocus(); 
      
      // set nice resolution...
      setResolution( 0, 0 ); 
      
      
      return true; 
    }
    else{
      System.err.println( "Fullscreen mode not available" ); 
      return false; 
    }
  }
  else{
    // remove applet from fsFrame and attach to processing frame
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


/**
 * Change display resolution. Only sets the resolution, use 
 * setFullScreen( true ) to go to fullscreen mode! 
 *
 * If you're not in fullscreen mode it memorizes the resolution and sets
 * it the next time you go in fullscreen mode
 *
 * @returns true if resolution change succeeded, false if not
 */
public boolean setResolution( int xRes, int yRes ){
  if( xRes > 0 && yRes > 0 ){
    fsResolutionX = xRes; 
    fsResolutionY = yRes; 
  }
  
  
  // only change in fullscreen mode
  if( !isFullScreen() ){
    return false; 
  }
  
  
  // Change resolution only if values are somehow meaningfull
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


  // Resolution not supported? 
  if( theMode == null ){
    System.err.println( "Display mode not supported: " + fsResolutionX + "x" + fsResolutionY ); 
    setLocation( ( fsDevice.getDisplayMode().getWidth() - width ) / 2, ( fsDevice.getDisplayMode().getHeight() - height ) / 2 ); 
    return false; 
  }


  // Wait until we are in fullScreen exclusive mode..
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



/**
 * Add keyboard short cuts (CTRL + F to toggle fullscreen mode)
 * Watch out - if you call this function twice weird things might happen! 
 */
public void createFullScreenKeyBindings(){
  fsBindKeys = true; 
}




final static int fsControlKey = Toolkit.getDefaultToolkit().getMenuShortcutKeyMask();

public void processKeyEvent( KeyEvent e ){
  
  // Are we allowed to look for key events? 
  if( fsBindKeys == false ){
    super.processKeyEvent( e ); 
  }
  
  // Catch the ESC key if in fullscreen mode
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
  
  // catch the cmd+f combination (alt+enter or ctrl+f for windows)
  else if( e.getID() == KeyEvent.KEY_PRESSED ){
    if( ( e.getKeyCode() == e.VK_F && e.getModifiers() == fsControlKey ) ||
        ( platform == WINDOWS && e.getKeyCode() == e.VK_ENTER && e.getModifiers() == e.VK_ALT ) ){
      // toggle fullscreen! 
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


/**
 * A window listener for the fullscreen window, that 
 * calls the exit() function of processing when the window 
 * is closed (using alt+f4, apple+w, or whatever)
 */
class FSWindowListener extends WindowAdapter{
  public void windowClosing( WindowEvent e ){
    // let processing exit! 
    exit(); 
  }
}



/**
 * A thread that invokes the setFullScreen() functionality delayed, 
 * in case it's called from setup()
 */
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
static public void main(String args[]) {   PApplet.main(new String[] { "ard_thermo_read_beta_FTP" });}}