import processing.opengl.*;

FasterMovie fm;
PImage mImage;

void setup ()
{
    size(320,240,OPENGL);
    frameRate(25);
    fm = new FasterMovie(this, sketchPath+"/data/temp5.mov", false);
    fm.loop();  
    noStroke();
   
}

void draw ()
{
    //image( fm, 0,0, width, height );
    fm.jump(random(36));
    tint(255,150);
    if ( mImage != null ) image( mImage, -random(0,width),-random(0,width),random(width*2,width*5),random(height*2,height*5));
}

void movieImageAvailable ( PImage _movieImage )
{
    mImage = _movieImage;   
}
