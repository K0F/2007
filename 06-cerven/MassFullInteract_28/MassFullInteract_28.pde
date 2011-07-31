import processing.opengl.*;


	Hlava[] b= new Hlava[500];
	color cols;
	void setup(){
		size(400,400,OPENGL);
		background(0);
		stroke(255,0,0,85);
		
		//frame.setUndecorated(true);
		
		for(int i = 0;i<b.length;i++){
			cols = color(random(255),random(255),random(255));
			b[i]=new Hlava(this,random(width),random(height),cols,i);
		}
		
	}
	
	void draw(){
		noStroke();
		fill(0,5);
		rect(0,0,width-1,height-1);
		
		for(int i = 0;i<b.length;i++){
			b[i].drw();
		}
		
	}
	
	public void mousePressed(){
		if(mouseButton==RIGHT){
			this.exit();
			
		}
		
	}
	
	
	
	
	
	class Hlava{

	float x,y;
	public PApplet h;
	color c;
        int id;
	float distn;
	
	Hlava(PApplet _h,float _x,float _y,color _c,int _id){
		//init();
		h=_h;
		x=_x;
		y=_y;
		c=_c;
		id=_id;
	}
	
	public void drw(){
		
		rand();
		check();
		
		
	}
	
	public void rand(){
		x+=random(-1.75f,1.75f);
		y+=random(-1.75f,1.75f);
		if(x<=0){x+=random(13);}
		if(y<=0){y+=random(13);}
		x=x%width;
		y=y%height;
	}
	
	public void check(){
		for(int i = 0;i<b.length;i++){
                distn=dist(x,y,b[i].x,b[i].y);
		if(distn<30f){
			c=((lerpColor((b[i].c),(c),0.99995f)));
                        c=((lerpColor(#FFFFFF,(c),0.999995f)));
			distn=dist(x,y,b[i].x,b[i].y);
			//c+=color(color(b[i].c)-color(c))/10000.0f*(26f-distn);
			x+=(x-b[i].x)/10000.0f*(26f-distn);
			y+=(y-b[i].y)/10000.0f*(26f-distn);
			
			
			if(abs(b[i].c-c)<1){
				c=abs(int(random(min(c,b[i].c)-distn*20,max(c,b[i].c)+distn*20)));
				
			}
			stroke(c,35);
			line(x,y,b[i].x,b[i].y);
			
		}
		}
		
	}
	
	}
	
	




