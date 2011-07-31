PFont font;
int[] days = new int[2];
int[] months = new int[2];
int[] years = new int[2];
int[] hours = new int[2];
int[] minutes = new int[2];
int[] seconds = new int[2];
String mm,dd,h,m,s;

void setup(){
  size(300,300);
  background(5);
  font = loadFont("Uni0553-8.vlw");
  textFont(font);
  days[0]=day();
  months[0]=month();
  years[0]=year();
  hours[0]=hour();
  minutes[0]=minute();
  seconds[0]=second();


}

void draw(){
  backgroundF(10);
  update(0);
  if(minutes[0]<10){
    m="0"+str(minutes[0]);
  }
  else{
    m=""+minutes[0];
  }
  if(seconds[0]<10){
    s="0"+str(seconds[0]);
  }
  else{
    s=""+seconds[0];
  }
  if(hours[0]<10){
    h="0"+str(hours[0]);
  }
  else{
    h=""+hours[0];
  }
  if(months[0]<10){
    mm="0"+str(months[0]);
  }
  else{
    mm=""+months[0];
  }
  if(days[0]<10){
    dd="0"+str(days[0]);
  }
  else{
    dd=""+days[0];
  }

  fill(255);
   text(h+":"+m+":"+s,map(seconds[0],0,60,0,width-30),map(minutes[0],0,60,10,height)); 
  if(seconds[0]!=seconds[1]){
    fill(255);
    text(h+":"+m+":"+s,map(seconds[0],0,60,0,width-30),map(minutes[0],0,60,10,height)); 
  }
  update(1);

}

void backgroundF(int k){
 noStroke();
fill(0,k);
rect(0,0,width,height);
  
}


void update(int p){
  days[p]=day();
  months[p]=month();
  years[p]=year();
  hours[p]=hour();
  minutes[p]=minute();
  seconds[p]=second(); 


}
