import processing.opengl.*;

int num = 6600;
Raven[] raven = new Raven[num];

int cnt = 0;

void setup(){
	size(350,300,OPENGL);
	background(0);

	//-----------------------* frame title
	frame.setTitle("seda kompozice 2 :: krystof pesek");
	//-----------------------*
	frame.show();

	for(int i = 0;i< num ;i++){
		raven[i]= new Raven(i);
	}
	noStroke();
	fill(255,15);
	cursor(CROSS);
	rectMode(CENTER);
}

void draw(){
	background(255);

	
	noFill();
	stroke(0,10);
	for(int i = 0;i< num;i+=10){
		stroke(0,norm(i,num,i));
		strokeWeight((norm(i,num,0)*10.0));
		line(raven[i].x,raven[i].y,raven[i].x,height);
		//line(raven[i].x,raven[i].y,width,raven[i].y);
	}
	noStroke();

	for(int i = 0;i< num ;i++){
		raven[i].draw();
	}

}

class Raven{
	float  x;
	float  y;
	float tx,ty;
	int id;
	float dis = 1.0;
	float speed = 1.03;

	Raven(int _id){
		id=_id;
		tx=x=random(width);
		ty=y=random(height);
	}

	void compute(){
		if(id!=0){
			tx += (raven[id-1].x-tx)/speed;
			ty += (raven[id-1].y-ty)/speed;
			dis = dist(x,y,raven[id-1].x,raven[id-1].y);
		}else{
			/*
			tx += (mouseX - tx)/speed;
			ty += (mouseY - ty)/speed;*/

			tx += (random(-width,width*2) - tx)/speed;
			ty += (random(-height,height*2) - ty)/speed;
		}


		x+=(tx-x)/(sq(speed));
		y+=(ty-y)/(sq(speed));



	}

	void draw(){
		compute();
		fill(0,map(dis,0,55.0,5,0));
		rect(x,y,norm(dis,0,5.0)*2+0.5,norm(dis,0,5.0)+0.5);
	}


}
