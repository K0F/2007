/*
* pohybove studie kp07
*
*/

import processing.video.*;
import processing.opengl.*;


int num = 2000;
float[] X = new float[num];
float[] speed = new float[num];

MovieMaker mm;
PFont font;

void setup(){
	size(400,200,OPENGL);

	this.reset();

	mm = new MovieMaker(this, width, height, "drawing2.mov",25, MovieMaker.JPEG, MovieMaker.HIGH);

	font =  new PFont();
	font = loadFont("00Antix-8.vlw");
	textFont(font);

	background(0);
	noStroke();
	fill(#FFFFFF,50);
	rectMode(CENTER);
	noSmooth();
}

void draw(){

	background(0);

	for(int i = 0;i < num;i++){
		X[i]+=speed[i];
		if(X[i]>width) {
			X[i]=0;
		}
		
		pushMatrix();
		//rect((int)X[i],map(i,0,num,0,height),10,10);
		translate((int)X[i],(int)map(i,0,num,0,height));
		text(i,0,0);
		popMatrix();
	}
	mm.addFrame();
}

void mousePressed(){
	this.reset();
}

void reset(){
	for(int i = 0;i < num;i++){
		speed[i] = random(0.002,1.0);
	}
}

//-----------------------  >

void keyPressed(){
	if(key==' '){
		save("screen.png");
	} else if(keyCode==ENTER){
		mm.finish();
		println("hotovo!");
	}
	keyPressed=false;
}

