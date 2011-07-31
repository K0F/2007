/*programable poetry of vrat mystery */
import processing.opengl.*;

int num = 900;
VRATone [] one = new VRATone[num];

void setup(){
	size(200,200,OPENGL);
	background(0);
	rectMode(CENTER);
	reGenerate();
	
}


void draw(){
	background(0);

	for(int i = 0;i<num;i++){
		one[i].run();
	}
}

void reGenerate(){
	for(int i = 0;i<num;i++){
		one[i] = new VRATone(-5,(int)random(height),i);
	}
}

void mousePressed(){
	reGenerate();
	
}

