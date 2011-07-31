import processing.opengl.*;

// A Less Simple Carnivore Client
//
// Note: requires Carnivore Library for Processing v2.2 (http://r-s-g.org/carnivore)
//
// + Windows people:  first install winpcap (http://winpcap.org)
// + Mac people:      first open a Terminal and execute this commmand: sudo chmod 777 /dev/bpf*
//                    (must be done each time you reboot your mac)

import java.util.Iterator;
import org.rsg.carnivore.*;
import org.rsg.carnivore.net.*;

HashMap nodes = new HashMap();
float startDiameter = 100.0;
float shrinkSpeed = 0.97;
int splitter, x, y;
String lastPacket = "";

void setup(){
  size(800, 600,OPENGL);
  background(255);
  frameRate(20);
  ellipseMode(CENTER);
  noSmooth();
  
  frame.setTitle("feeder");
  
 // Log.setDebug(true); // Uncomment this for verbose mode
  CarnivoreP5 c = new CarnivoreP5(this);
  //c.setVolumeLimit(4);
  
  // Copy this font into your sketch's "data" folder 
  // from processing/examples/Typography/Letters/data
  textFont(loadFont("ArialUnicodeMS-9.vlw"),9);  
 
}

void draw() {
  background(255);
  drawNodes();
}

// Iterate through each node 
synchronized void drawNodes() {
  Iterator it = nodes.keySet().iterator();
  while(it.hasNext()){
    String ip = (String)it.next();
    float d = float(nodes.get(ip).toString());

    // Use last two IP address bytes for x/y coords
    splitter = ip.lastIndexOf(".");
    y = int(ip.substring(splitter+1)) * height / 255; // Scale to applet size
    String tmp = ip.substring(0,splitter);
    splitter = tmp.lastIndexOf(".");
    x = int(tmp.substring(splitter+1)) * width / 255; // Scale to applet size
    
    // Draw the node
    stroke(0);
    fill(color(100, 100, 100, 200)); // Rim
    ellipse(x, y, d, d);             // Node circle
    noStroke();
    fill(color(100, 100, 100, 50));  // Halo
    ellipse(x, y, d + 20, d + 20);
    
    // Draw the text
    fill(0);
    text(ip, x, y);
    text(lastPacket,10,10);
    // Shrink the nodes a little
    nodes.put(ip, str(d * shrinkSpeed));
  }  
}

// Called each time a new packet arrives
synchronized void packetEvent(CarnivorePacket packet){
  //println("[PDE] packetEvent: " + packet);
  lastPacket = packet.toString()+"";
  println(lastPacket);
  // Remember these nodes in our hash map
  nodes.put(packet.receiverAddress.toString(), str(startDiameter));
  nodes.put(packet.senderAddress.toString(), str(startDiameter));
}
