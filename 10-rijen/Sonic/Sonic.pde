

Camera cam;

void setup(){
 size(320,240);
background(0); 
  
   cam = new Camera(45,36,1);  //sirka,vyska,resoluce
  
}

void draw(){
  cam.viz();  
    
}
