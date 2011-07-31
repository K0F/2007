import processing.core.*;
 
public class test extends PApplet{
	public static void main(String args[]) {
  PApplet.main(new String[] { "--present", "test" });
 } 

 public void setup(){
 	size(200,200);
 	background(0);
 	
 	//-----------------------* frame title
 	frame.setTitle(" :: krystof pesek");
 	//-----------------------*
 	frame.show();
	
	stroke(255,15);
	
 }
 
 public void draw(){
	 background(0);
	 point(random(width),random(height));
 }

}

