// Authors: Brighten Jelke and Khin Kyaw

// uwnd stores the 'u' component of the wind.
// The 'u' component is the east-west component of the wind.
// Positive values indicate eastward wind, and negative
// values indicate westward wind.  This is measured
// in meters per second.
Table uwnd;

// vwnd stores the 'v' component of the wind, which measures the
// north-south component of the wind.  Positive values indicate
// northward wind, and negative values indicate southward wind.
Table vwnd;

// An image to use for the background.  The image I provide is a
// modified version of this wikipedia image:
//https://commons.wikimedia.org/wiki/File:Equirectangular_projection_SW.jpg
// If you want to use your own image, you should take an equirectangular
// map and pick out the subset that corresponds to the range from
// 135W to 65W, and from 55N to 25N
PImage img;
int numParticle = 3000;
Particle[] particles;

int maxLifetime = 300;

void setup() {
  // If this doesn't work on your computer, you can remove the 'P3D'
  // parameter.  On many computers, having P3D should make it run faster
  size(700, 400, P3D);
  pixelDensity(displayDensity());
  
  img = loadImage("background.png");
  uwnd = loadTable("uwnd.csv");
  vwnd = loadTable("vwnd.csv");
  
  particles = new Particle[numParticle];
  loadData();
  
}

void draw() {
  background(255);
  image(img, 0, 0, width, height);
  stroke(0,0,255,255);
  drawMouseLine();
 
  strokeWeight(3);
  fill(153);
  beginShape(POINTS);
   
  // draw particles
  for (int i = 0; i < particles.length; i++) {
     Particle p = particles[i];
     // decrease lifetime if necessary
     if(p.lifeTime < 1){
       p.lifeTime = randomVal(maxLifetime, 0);
       p.newRandomPosition();
     }
     else{
       p.decrementLife();
     }
     // calculate opacity
     int transparency = (int)map(p.lifeTime, 0, maxLifetime, 0, 255);
     stroke(0,0,255,transparency);
     
     vertex(p.x, p.y);
     
     // calculate movement
     float a = p.x * uwnd.getColumnCount() / width;
     float b = p.y * uwnd.getRowCount() / height;
     float dx = readInterp(uwnd, a, b);
     float dy = readInterp(vwnd, a, b);
     
     //p.updatePositionEuler(dx,dy);
     p.updatePositionRK(dx,dy, uwnd, vwnd, a, b);
  }
  endShape();
}


//Get random value between lower bound (lb) and upper bound (ub) 
  int randomVal(int lb, int ub){
      int randomVal = (int)(Math.random() * ub + lb);
      return randomVal;
  }

 void drawMouseLine() {
  // Convert from pixel coordinates into coordinates
  // corresponding to the data.
  float a = mouseX * uwnd.getColumnCount() / width;
  float b = mouseY * uwnd.getRowCount() / height;
  
  // Since a positive 'v' value indicates north, we need to
  // negate it so that it works in the same coordinates as Processing
  // does.
  float dx = readInterp(uwnd, a, b) * 10;
  float dy = -readInterp(vwnd, a, b) * 10;
  line(mouseX, mouseY, mouseX + dx, mouseY + dy);
}

// Reads a bilinearly-interpolated value at the given a and b
// coordinates.  Both a and b should be in data coordinates.
static float readInterp(Table tab, float a, float b) {
  // find four surrounding points
  int x1 = int(a);
  int y1 = int(b);
  float val1 = readRaw(tab, x1, y1);

  int x2 = x1+1;
  int y2 = y1;
  float val2 = readRaw(tab, x2, y2);

  int x3 = x1;
  int y3 = y1+1;
  float val3 = readRaw(tab, x3, y3);

  int x4 = x1 + 1;
  int y4 = y1 + 1;
  float val4 = readRaw(tab, x4, y4);
  float result = bilinearInterpolation((float) x1, (float) y1, val1, (float) x2, (float) y2, val2, (float) x3, (float) y3, val3,(float) x4, (float) y4, val4, a, b);

  return result;
}

// Reads a raw value 
static float readRaw(Table tab, int x, int y) {
  if (x < 0) {
    x = 0;
  }
  if (x >= tab.getColumnCount()) {
    x = tab.getColumnCount() - 1;
  }
  if (y < 0) {
    y = 0;
  }
  if (y >= tab.getRowCount()) {
    y = tab.getRowCount() - 1;
  }
  return tab.getFloat(y,x);
}

static float bilinearInterpolation(float x1, float y1, float val1, float x2, float y2, float val2, float x3, float y3, float val3,
float x4, float y4, float val4, float px, float py){
  
  // find 2 values at x, then interpolate in the y direction
  float a = interpolationX(x1, val1, x2, val2, px);
  float b = interpolationX(x3, val3, x4, val4, px);
  return interpolationY(y1, a, y3, b, py);
}

// finds the value between two points
static float interpolationX(float x1, float val1, float x2, float val2, float px){
  return (x2-px)/(x2-x1) * val1 + (px - x1)/(x2-x1) * val2;
}

static float interpolationY(float y1, float val1,float y2, float val2, float py){ 
  return (y2 - py)/(y2-y1) *val1 + (py - y1)/(y2-y1) * val2;
}

// initialize particles
void loadData(){
   for (int i = 0; i < numParticle; i++) {
     //Get random x, y position and lifetime
     int randomX =  randomVal(0, width);
     int randomY =  randomVal(0, height);
     int lifeTime =  randomVal(0, maxLifetime);
     particles[i] = new Particle(randomX, randomY, lifeTime);
   }
}