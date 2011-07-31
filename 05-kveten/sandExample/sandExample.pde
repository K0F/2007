 int div = 4;
int w = 128/div, h = 96/div;
color cStuck;
color cMove;
groundPoint[][] ground = new groundPoint[w][h];
int gSpeed = 1;
 
void setup()
{
  size(w,h);
  cStuck = color(0);
  cMove = color(20,120,20);
  for(int i = 0; i < w; i++)
    for(int j = 0; j < (h/2); j++)
      if((int)random((16/div)*(w/h))==0) ground[i][j] = new groundPoint(i,j,1);
  for(int i = (w/2); i < w; i++){
    for(int j = 0; j < 1; j++){
      ground[i][(int)(j+((h/4)*2))] = new groundPoint(i,j+((h/4)*2),0);
      ground[(int)(i-(w/2))][(int)(j+((h/4)*3))] = new groundPoint(i-(w/2),j+((h/4)*3),0);
    }
  }
}
 
void draw()
{
  background(0);
  for(int z = 0; z < gSpeed; z++){
    for(int i = w-1; i >= 0; i--)
      for(int j = h-1; j >= 0; j--)
        if(ground[i][j] != null) ground[i][j].draw();
  }
  stroke(255);
  line(0,0,128,0);
  line(128,0,128,128);
  line(128,128,0,128);
  line(0,128,0,0);
}
 
class groundPoint
{
  int mode; // 0 = sticky, 1 = movable
  int x, y;
  boolean alive;
 
  groundPoint(int x, int y, int mode)
  {
    this.x = x;
    this.y = y;
    this.mode = mode;
    this.alive = true;
  }
 
  void draw()
  {
    if(alive){
      noStroke();
      if(mode == 0)
      {
        fill(redd(cStuck),greend(cStuck),blued(cStuck));
        ellipse(x*div,y*div,div,div);
      }
      else{
        fill(redd(cMove),greend(cMove),blued(cMove));
        ellipse(x*div,y*div,div,div);
        update();
      }
    }
  }
 
  void update()
  {
    if( mode == 1 && y <= h-2)
    {
      if( !drop_south( x, y ) )
      {
        if( random(100) > 50.0 )
        {
          if ( !drop_southeast( x, y ))
            drop_southwest( x, y );
        }  
        else {
          if ( !drop_southwest( x, y ))
            drop_southeast( x, y );
        }
      }
    }
  }
}
 
 
boolean drop_south( int i, int j )
{
  if( ground[i][j+1] == null )
  {
    ground[i][j+1] = new groundPoint(i,j+1,1);
    ground[i][j] = null;
    return true;
  }
  return false;
}
 
boolean drop_southeast( int i, int j )
{
  if( i < 1 ) return false;
 
  if( ground[i-1][j+1] == null )
  {
    ground[i-1][j+1] = new groundPoint(i-1,j+1,1);
    ground[i][j] = null;
    return true;
  }
  return false;
}
 
boolean drop_southwest( int i, int j )
{
  if( i > w-2 ) return false;
 
  if( ground[i+1][j+1] == null)
  {
    ground[i+1][j+1] = new groundPoint(i+1,j+1,1);
    ground[i][j] = null;
    return true;
  }
  return false;
}
 
void keyPressed()
{
  if(keyCode == LEFT){
    ground[int(random(w/2))][(int)((h/4)*3)] = null;
  }
  if(keyCode == RIGHT){
    ground[int(w/2+random(w/2))][(int)((h/4)*2)] = null;
  }
}
 
 
int redd(color c){
  int r = c>>16&0xff;
  return r;
}
 
int greend(color c){
  int g = c>>8&0xff;
  return g;
}
 
int blued(color c){
  int b = c&0xff;
  return b;
}
