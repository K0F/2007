class VRATone{
	float x,y;
	float step = 2;
	float sina;
	float amp;
	float xa;
	float distance = 5;
	float limit;
	color c = color(255,45);
	int r = 10;
	int id;
	float rea = 20.0;
	float bordr = 5.0;

	VRATone(int _id){
		this((int)random(width),(int)random(height),_id);
	}

	VRATone(int _X,int _Y,int _id){
		x=_X;
		y=_Y;
		step = random(0.2,8);
		sina = 8.0;//random(10.0,80.0);
		amp = 10.0;// random(10.0);
		xa = random(height);
		id = _id;
		limit = r;
	}

	void run(){
		compute();
		draw();
	}

	void compute(){
		x+=step;

		y+=((sin(x/sina)*amp+xa)-y)/(rea/3.0);

		if(x>width){
			x=-5;
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
