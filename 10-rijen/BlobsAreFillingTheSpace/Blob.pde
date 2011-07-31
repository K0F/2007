class Blob{

  int num; 
  int id;
  int cntr;
  float x[];
  float y[];
  float dista;
  float radius = 30;


  Blob(int _id,int _num){
    id=_id;
    num = _num;
    reset(); 
    cntr = (int)random(100);
  }



  void shape(){
    beginShape();

    for(int i = 0;i<num;i++){
      vertex(x[i],y[i]);
    }

    endShape(CLOSE);

    // rebuild(3);


  }

  void rebuild(int _numero){

    if(frameCount%_numero == 0){
      reset(); 
    } 

  }

  void  reset(){
    //  println(num);
    x = new float[num];
    y = new float[num];

    for(int i = 0;i<num;i++){
      x[i] = random(width);
      y[i] = random (height);
    } 

    x[num-1]=x[0];
    y[num-1]=y[0];
  }

  void run(){
   
    attraction(240);
    refusion(2000);
    
     cntr++;    
    int res = 40*((int)sin(cntr/300.0)+1);
    //if(res == 0){res=1;}
    
    move(20,res);
    shape();
    border();
  }

  void move(int koef,int speed){

    for(int i = 0;i<num;i++){
      x[i] += (random(x[i]-koef,x[i]+koef)-x[i])/speed;
      y[i] += (random(y[i]-koef,y[i]+koef)-y[i])/speed;
    }

    x[num-1]=x[0];
    y[num-1]=y[0];
  }

  void attraction(int speed){

    for(int n = 0;n<quanto;n++){
      for(int i = 0;i<num;i++){

        dista = dist(x[i],y[i],b[n].x[i],b[n].y[i]);
        if((dista<radius)&&(n!=id));
        x[i] += (b[n].x[i]-x[i])/speed;
        y[i] += (b[n].y[i]-y[i])/speed;

      }
    }
}

  void refusion(int speed){

    for(int i = 0;i<num;i++){
      dista = dist(x[i],y[i],x[constrain(i-1,0,num)],y[constrain(i-1,0,num)]);
      x[i] += (x[i]-x[constrain(i-1,0,num)])/speed;
      y[i] += (y[i]-y[constrain(i-1,0,num)])/speed;

    }


  }  
  
  void border(){
     for(int i = 0;i<num;i++){
      if((x[i]>width)||(x[i]<0)||(y[i]>height)||(y[i]<0)){
       reset(); 
      }      
    }    
  }
}
