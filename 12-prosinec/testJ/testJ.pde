
//import processing.opengl.*;

int num = 1500;
Gem [] gem = new Gem [num];
int wi ;
void setup(){
	size(600,600);
	background(0);

	//-----------------------* frame title
	frame.setTitle("test :: krystof pesek");
	//-----------------------*
	frame.show();

	wi = (int)sqrt(num)-1;
	for(int i = 0;i<num ;i++){
		gem[i] = new Gem(random(width),random(height),i);
	}
	/*
	for(int i = 0;i<num  ;i++){
		gem[i] = new Gem(i,(sq(i)%width)%height,i);
		}
	*/

	//println(gem);
	noStroke();
	fill(255,constrain((255/num)*5.0,15,255));

	println("setted up, jedem!");
}
void draw(){
	//background(0);

	for(int i = 0;i< num;i++){
		gem[i].go();
	}
}

void mousePressed(){
	gem[0].erase_that_stupid_things_or_someone_will_die();

}

class Gem{
	float x,y;
	float x2,y2;
	int id;
	float distn = 1.0;
	float lim = 20.0;
	float koef = 120.0;
	Gem(float _x,float _y,int _id){
		x=_x;
		y=_y;
		id=_id;
	}

	void go(){
		do_something_intereseting_here_please();
	}

	void do_something_intereseting_here_please(){

		for(int i = 0;i< num;i++){
			if(i!=id){
				distn = dist(x,y,gem[i].x,gem[i].y);
				distn = constrain(distn,1.001,width);
			}
			if(distn<lim){
				x+=(gem[i].x-x)/(distn*koef);
				y+=(gem[i].y-y)/(distn*koef);
				if(i>0){
					x-=(gem[i-1].x-x)/(distn*koef);
					y-=(gem[i-1].y-y)/(distn*koef);
					gem[i].x+=(x-gem[i-1].x)/(distn*koef/2.0);
					gem[i].y+=(y-gem[i-1].y)/(distn*koef/2.0);
				}
			}
		}
		rect(x,y,2,1);
		//when_you_one_day_reach_the_border_try_to_do_not_panic();
	}

	void when_you_one_day_reach_the_border_try_to_do_not_panic(){
		if(x>width){x=1;}
		if(x<0){x=width-1;}
		if(y>height){y=1;}
		if(y<0){y=height-1;}
	}

	void erase_that_stupid_things_or_someone_will_die(){
		//background(0);
		for(int i = 0;i<num ;i++){
			gem[i] = new Gem(random(width),random(height),i);
		}
	}

}


