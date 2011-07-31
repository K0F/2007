import processing.opengl.*;


int s;
float[][] x = new float[201][21];
float[][] y = new float[201][21];
void setup(){
  size(200,400,OPENGL); 
  background(0);
  smooth();
  frame.setTitle("sinExperiments by kof");
  stroke(255,35);
  noFill();
  for(int q = 0;q<21;q++){
    for(int i = 0;i<200;i++){
      x[i][q]=width/2;
      y[i][q]=i; 
    }
  }

}

void draw(){
 background(0);
 
 
  
  for(int q = 0;q<21;q++){
    beginShape();
    for(int i = 0;i<=200;i++){
      y[i][q]=i;

      if(i==200){
        x[i][q]+=(mouseX-x[i][q])/(q*4.0); 
        x[i][q]+=(random(mouseX-50.0,mouseX+50.0)-x[i][q])/(dist(x[i][q],y[i][q],x[constrain(i+1,0,200)][q],y[i][constrain(q+1,0,20)])+1.0);
        x[i][q]=constrain(x[i][q],0,width);
      }else if(i==0){
        x[i][q]=q*10;
         /*x[i][q]-=(mouseX-x[i][q])/(q*4.0); 
        x[i][q]-=(random(mouseX-50.0,mouseX+50.0)-x[i][q])/(dist(x[i][q],y[i][q],x[constrain(i-1,0,200)][q],y[i][constrain(q-1,0,20)])+1.0);
        x[i][q]=constrain(x[i][q],0,width);*/
      }
      x[i][q]+=(x[constrain(i+1,0,200)][q]-x[i][q])/(2.0+(q*0.01));
      x[i][q]+=(x[constrain(i-1,0,200)][q]-x[i][q])/(4.0+(i*0.01));

      // x[i][q]+=(x[i][constrain(q+1,0,20)]-x[i][q])/(16.0+(height-i));
      x[i][q]-=(x[i][constrain(q+1,0,20)]-x[i][q])/(random(10.0,14.1)+(height-i));
      x[i][q]+=(x[i][constrain(q+1,0,20)]-x[i][q])/(random(10.0,14.0)+(height-i));


      x[i][q]+=((x[i][q]+random(-15.3,15.3))-x[i][q])/18.0;

       stroke(255,55);
        noFill();
      vertex((x[i][q]),map(y[i][q],0,200,0,height)); 
    }
    endShape();
  }
}

void fadeoff(int _kolik){
  
  fill(0,_kolik); 
  noStroke();
  rect(0,0,width,height);

}

void keyPressed(){
  saveFrame("frame-###.png"); 
  keyPressed=false;

}

