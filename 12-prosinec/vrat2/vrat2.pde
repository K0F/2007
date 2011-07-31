/*programable poetry of vrat mystery */

import processing.video.*;
import processing.opengl.*;

///////////////////////////////////////////// scop

int num = 2500;
VRATone [] one = new VRATone[num];
MovieMaker mm;
boolean closed = false;
float approxT;
int timer,timerOld,frameT;

///////////////////////////////////////////// set

void setup(){
	size(200,200);
	background(0);
	rectMode(CENTER);
	reGenerate();
	mm = new MovieMaker(this, width, height, "render.mov",25, MovieMaker.JPEG, MovieMaker.HIGH);
	println("/////////////////////////////////////////////");
	println("press enter to close the movie file");
	noSmooth();
	noFill();
	timer = millis();
	timerOld = timer;
}

///////////////////////////////////////////// loop

void draw(){
	timerOld = millis();
	background(0);

	for(int i = 0;i<num;i++){
		one[i].run();
	}

	mm.addFrame();

	timer = millis()-timerOld;

	frameT = (int)timer;
	approxT+=((int)frameT-approxT)/(25.0);
}

///////////////////////////////////////////// funkce

void reGenerate(){
	for(int i = 0;i<num;i++){
		one[i] = new VRATone(-5,(int)random(height),i);
	}
}

void keyPressed(){
	if((keyCode==ENTER)&&(!closed)){
		closed = true;
		mm.finish();
		int whole = round( millis()/1000.0 );
		float virtual = (frameCount/25.0);
		println("/////////////////////////////////////////////");
		print("video done!\n\n");
		println("number of particles: "+num);
		println("duration: " + virtual +"sec !");
		println("frameCount: "+frameCount);
		println("rendered in: "+whole+"sec" );
		println("render ratio: "+(whole/virtual)+"$");
		println("approx. frame render time: "+(approxT/1000.0)+"sec");
		println("/////////////////////////////////////////////");
	}
}

void mousePressed(){
	reGenerate();
}
