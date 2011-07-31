import processing.opengl.*;


	Hlava[] b= new Hlava[400];
  	color cols;
        PFont font;
        
boolean accept = true;

	void setup(){
		size(400,400,OPENGL);
frameRate(30);
		background(0);
		stroke(255,0,0,85);
                frame.setTitle(" cNEcT");
           
		font = loadFont("Verdana-9.vlw");
                
                textFont(font);
                
	
		for(int i = 0;i<b.length;i++){
			cols = color(random(255),random(255),random(255));
			b[i]=new Hlava(this,random(width),random(height),cols,i);
		}
		
	}
	
	void draw(){
		noStroke();
		fill(0,25);
		rect(0,0,width-1,height-1);
		
		for(int i = 0;i<b.length;i++){
			b[i].drw();
		}
            /*    if(frameCount%30==0){
                  for(int i = 0;i<b.length;i++){
			b[i].rerand(25);
		}
                  
                }*/
        	
	}
	
	public void mousePressed(){
		if(mouseButton==RIGHT){
			this.exit();
			
		} else {
   for(int i = 0;i<b.length;i++){
			b[i].rerand(25);
		}
}
		
	}
	
	class Hlava{

	float x,y,x2,y2,X,Y;
        float xs,ys;
        float Xf,Yf;
	public PApplet h;
	color c;
        int id;
	float distn;
	float time  = 0;
	float speed;
        String txt;
        Hlava(PApplet _h,float _x,float _y,color _c,int _id){
		//init();
		h=_h;
		x=_x;
		y=_y;
		c=_c;
		id=_id;
                time=random(0.0f,1.0f);
                speed=random(1.0f,33.0f);
                xs=x;
                ys=y;
                txt=""+(xs+"\t"+ys);
                
	}
	
	public void drw(){
		time+=0.33f;
		rand();
		check(33.33f);
		//interact();  >> no go
		
	}

public void rerand(int _kolik){
  x+=random(-_kolik,_kolik);
  y+=random(-_kolik,_kolik);
  
  
}

public void interact(){
 x+=(mouseX-x)/(constrain(dist(mouseX,mouseY,x,y),1,width)); 
  y+=(mouseX-x)/(constrain(dist(mouseX,mouseY,x,y),1,width));
  
  
}
	
	public void rand(){
		x+=random(-3.75f,3.75f);
		y+=random(-3.75f,3.75f);
		/*if(x<=0){x+=random(13);}
		if(y<=0){y+=random(13);}
		*/
//------------------------bounds >>

                if(x<=0){x=10;}
                if(x>=width){x=width-10;}
                if(y<=0){y=10;}
                if(y>=width){y=width-10;}
	}
	
	public void check(float _okruh){
                   X=abs(xs-x2);
                        Y=abs(ys-y2);
  
		for(int i = 0;i<b.length;i++){
                distn=dist(x,y,b[i].x,b[i].y);
		if((distn<_okruh)/*&&(distn>2) performance */){
  
    
                     
                        
                        
                        Xf= b[i].x-x;
                         Yf= b[i].y-y;
                         c=((lerpColor(c,#11FF11,0.999995f)));
                        c=lerpColor(c,#FF1111,constrain(map(abs(X+Y),0.0,2.2f,0f,1f),0f,1f));
			//c=((lerpColor((b[i].c),(c),0.999995f)));
                       // c=((lerpColor(#FFFFFF,(c),0.499995f)));
			distn=dist(x,y,b[i].x,b[i].y);
			
//c+=color(color(b[i].c)-color(c))/10000.0f*(26f-distn);

//-----------------------pos >>
			x+=(x-b[i].x)/100.0f*(26f-distn);
			y+=(y-b[i].y)/100.0f*(26f-distn);
			x+=(Xf)/1000.0;
                        y+=(Yf)/1000.0;
                        			
                        if(distn<2.0f){
                         x-=(Xf)*10.0;
                          y-=(Yf)*10.0;
                                                   
                        }
                        
			/*if(abs(b[i].c-c)<1){
				c+=abs(int(random(min(c,b[i].c)-distn*20,max(c,b[i].c)+distn*20)))/10000.0f;
				
			}*/

                        Y=abs( x - x2 );
                        X=abs( y - y2 );

			xs += ( x - xs ) / 50.0;
                        ys += ( y - ys ) / 50.0;
                        //txt="";
                        //txt=""+(id);
                      
                        
                        x2 = x;
                        y2 = y;
                        
                        strokeWeight( constrain ( map ( abs (X+Y) ,0.2f ,2.15f ,0f ,1f ) ,1f ,5f ) );
                        stroke(c,15f );
			//fill(255,85);
                        line(xs ,ys ,b[i].xs ,b[i].ys );
			//text(txt,xs,ys);

		}
		}

                      
		
	}
	
	}





