class VRATone{
	float x,y;
	float step = 2;
	float sina;
	float amp;
	float xa;
	float distance;
	float limit;
	color c = color(255,45);
	int r = 10;
	int id;
	float rea = 15.0;
	float bordr = 5.0;
	float rozptyl;

	VRATone(int _id){
		this((int)random(width),(int)random(height),_id);
	}

	VRATone(int _X,int _Y,int _id){
		x=_X;
		y=_Y;
		step = random(0.2,2.0);
		sina = 5.0;//random(10.0,80.0);
		amp = 20.0;// random(10.0);
		xa = random(height);
		id = _id;
		limit = r;
		rozptyl = random(0.0,10.0);
	}

	void run(){
		compute();	
		draw();
	}

	void compute(){
		x+=step;
		y+=((sin((x+rozptyl)/sina)*amp+xa)-y)/(rea/3.0);
		if(x>width+r){
			x=-r;
		}
		colide();
		bound();
	}

	void colide(){
		for(int s = 0;s<num;s++){
			if(s!=id){
				distance = dist(x,y,one[s].x,one[s].y);
				distance = constrain(distance,1.001,width);
			}

			if((s!=id)&&(distance<limit)){
				x-=(one[s].x-x)/distance;
				y-=(one[s].y-y)/distance;
				//draw();
			}
		}
	}

	void bound(){
		y = constrain(y,bordr,height-bordr);
	}

	void draw(){
		noFill();
		stroke(c);
		rect(x,y,r,r);
	}
}
