

// Fungi03
// David Bollinger, Feb 2007
// http://www.davebollinger.com
// for Processing 0123 Beta
//
/** Fungi #03<br>
(another variant of Fungi 01, true 3D)<br>
Click to advance to next set of coefficients.
*/

// the drawing buffer
FixedPointBuffer buf;
// screen origin and coordinate scaler
float ctrx, ctry, scaler;
// rotation animation
float rotx=0f, roty=0f;
// current t (aka time, used to animate coefficient values)
float t; 
// current random number seed to generate coef's
int currentseed = 0;
// number of control points
int ncps = 100;
// number of priming iterations per control point
int nprime = 10;
// number of iterations per control point
int niters = 1000;
// coefficients
int ncoefs = 9;
float [] coefs = new float[ncoefs];
// color values, as used by the fixed point buffer
int myred, mygrn, myblu;
float myalf;


void setup() { 
  size (360, 360, P3D); 
  buf = new FixedPointBuffer(width,height);
  ctrx = width / 2.0;
  ctry = height / 2.0;
  scaler = width / 5.0;
  frameRate(30); 
  myred = (255) << buf.shift;
  mygrn = (255/3) << buf.shift;
  myblu = (255/3/3) << buf.shift;
  myalf = 0.3;
  next();
} 

void next() {
  randomSeed(currentseed++);
  for (int i=0; i<ncoefs; i++)
    coefs[i] = random(-PI,PI);
  t = 0.0;
  buf.background(0,0,0);
}

void keyPressed() {
  if (key=='`') saveFrame("frame.tga");
  if (key=='m') niters = 10000;
  if (key=='l') niters = 1000;
}

void mousePressed() {
  next();
}

void draw() { 
  translate(ctrx, ctry, 0);
  scale(scaler);
  rotateX(rotx+=0.013);
  rotateY(roty+=0.017);
  t += 0.001;
  buf.fade();
  // for each of the many control points...  
  for (int i=ncps; i>0; i--) {
    float x = random(-1.0,1.0);
    float y = random(-1.0,1.0);
    float z = random(-1.0,1.0);
    // for each step along the control point's journey...
    for (int j=-nprime; j<niters; j++) {
      // modified to a 3D function here:
      float xp = sin((coefs[0]+t)*x) + sin((coefs[1]+t)*y) + sin((coefs[2]+t)*z); 
      float yp = sin((coefs[3]+t)*x) + sin((coefs[4]+t)*y) + sin((coefs[5]+t)*z); 
      float zp = sin((coefs[6]+t)*x) + sin((coefs[7]+t)*y) + sin((coefs[8]+t)*z); 
      x = xp;
      y = yp;
      z = zp;
      // plot 2D screen coords of the 3D control point
      if (j>=0)
        buf.add(screenX(x,y,z), screenY(x,y,z), myred, mygrn, myblu, myalf);
    }
  } 
  buf.render();
} 

// an 8.16 fixed point rgb buffer with sub-pixel sampling
// (the extra precision is used to reduce rounding errors during accumulation)
class FixedPointBuffer {
  static final int shift = 16; // number of .fixed bits
  static final int fixone = 1<<shift; // the "scale" of fixed point numbers
  static final int maxrgb = (256<<shift)-1; // max allowed for rgb values
  int wid, hei, area;
  int [] redbuf;
  int [] grnbuf;
  int [] blubuf;
  FixedPointBuffer(int w, int h) {
    wid = w;
    hei = h;
    area = wid * hei;
    redbuf = new int[area];
    grnbuf = new int[area];
    blubuf = new int[area];
    loadPixels();
  }
  void background(int r, int g, int b) {
    for (int idx=0; idx<area; idx++) {
      redbuf[idx] = r;
      grnbuf[idx] = g;
      blubuf[idx] = b;
    }
  }        
  void fade() {
    for (int idx=0; idx<area; idx++) {
/* scaling down by half, the easy solution, seems a bit too drastic
      redbuf[idx] >>= 1;
      grnbuf[idx] >>= 1;
      blubuf[idx] >>= 1;
   so scale by 3/4 instead...
*/
      redbuf[idx] = (redbuf[idx]*3)>>2;
      grnbuf[idx] = (grnbuf[idx]*3)>>2;
      blubuf[idx] = (blubuf[idx]*3)>>2;
    }
  }
  // plot additively
  void add(float x, float y, int r, int g, int b, float alf) {
    // convert to continuous coordinates
    x -= 0.5;
    y -= 0.5;
    // bounds check
    if ((x<0.0) || (y<0.0) || (x>=wid-1.0) || (y>=hei-1.0)) return;
    // integral coordinates
    int ix1 = (int)(x);
    int iy1 = (int)(y);
    int ix2 = ix1 + 1;
    int iy2 = iy1 + 1;
    // fractional coordinates
    float fractx = x - (float)(ix1);
    float fracty = y - (float)(iy1);
    // reciprocal of fractional coordinates
    float recipx = 1.0 - fractx;
    float recipy = 1.0 - fracty;
    // preconvert color values to floats
    float fr = (float)(r);
    float fg = (float)(g);
    float fb = (float)(b);
    // plot it
    float ratio;
    int idx, c;
    // upper-left
    ratio = recipx * recipy * alf;
    idx = iy1 * width + ix1;
    c = (int)((ratio*fr) + redbuf[idx]); if (c>maxrgb) c=maxrgb; redbuf[idx] = c;
    c = (int)((ratio*fg) + grnbuf[idx]); if (c>maxrgb) c=maxrgb; grnbuf[idx] = c;
    c = (int)((ratio*fb) + blubuf[idx]); if (c>maxrgb) c=maxrgb; blubuf[idx] = c;
    // upper-right
    ratio = fractx * recipy * alf;
    idx = iy1 * width + ix2;
    c = (int)((ratio*fr) + redbuf[idx]); if (c>maxrgb) c=maxrgb; redbuf[idx] = c;
    c = (int)((ratio*fg) + grnbuf[idx]); if (c>maxrgb) c=maxrgb; grnbuf[idx] = c;
    c = (int)((ratio*fb) + blubuf[idx]); if (c>maxrgb) c=maxrgb; blubuf[idx] = c;
    // lower-left
    ratio = recipx * fracty * alf;
    idx = iy2 * width + ix1;
    c = (int)((ratio*fr) + redbuf[idx]); if (c>maxrgb) c=maxrgb; redbuf[idx] = c;
    c = (int)((ratio*fg) + grnbuf[idx]); if (c>maxrgb) c=maxrgb; grnbuf[idx] = c;
    c = (int)((ratio*fb) + blubuf[idx]); if (c>maxrgb) c=maxrgb; blubuf[idx] = c;
    // lower-right            
    ratio = fractx * fracty * alf;
    idx = iy2 * width + ix2;
    c = (int)((ratio*fr) + redbuf[idx]); if (c>maxrgb) c=maxrgb; redbuf[idx] = c;
    c = (int)((ratio*fg) + grnbuf[idx]); if (c>maxrgb) c=maxrgb; grnbuf[idx] = c;
    c = (int)((ratio*fb) + blubuf[idx]); if (c>maxrgb) c=maxrgb; blubuf[idx] = c;
  }
  // render converts 8.shift format back down to 8 bit rgb
  void render() {
    for (int idx=area-1; idx>=0; idx--) {
      /*
      // general-purpose conversion for any shift...
      int r = ((redbuf[idx] >> shift) & 0xFF) << 16;
      int g = ((grnbuf[idx] >> shift) & 0xFF) << 8;
      int b = ((blubuf[idx] >> shift) & 0xFF);
      pixels[idx] = 0xFF000000 | r | g | b;
      */
      // optimized for shift of 16
      pixels[idx] = 0xFF000000 |
                    (redbuf[idx] & 0xFF0000) |
                    ((grnbuf[idx] & 0xFF0000) >> 8) |
                    ((blubuf[idx] & 0xFF0000) >> 16);
    }
    updatePixels();
  }
}
 
