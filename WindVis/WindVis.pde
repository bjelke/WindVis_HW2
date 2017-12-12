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
int numParticle = 2000;
Particle[] particles = new Particle[numParticle];

void setup() {
  // If this doesn't work on your computer, you can remove the 'P3D'
  // parameter.  On many computers, having P3D should make it run faster
  size(700, 400, P3D);
  pixelDensity(displayDensity());
  
  img = loadImage("background.png");
  uwnd = loadTable("uwnd.csv");
  vwnd = loadTable("vwnd.csv");
  loadData();
  
}


void draw() {
  background(255);
  image(img, 0, 0, width, height);
  drawMouseLine();

  //Check if the value of lifetime is zero, otherwise display it. 
  //Have an array of particles. Then display it then check the value of the life time. 
  //Diplay it using the shapeThing. 
  //Get a random value of postion and magnitude, then set the value. 
   for (int i = 0; i < particles.length; i++) {
     if(particles[i].lifeTime != 0.0){
       particles[i].lifeTime = randomLifetime(200, 0);
     }
     particles[i].display();
  }
}

//Get the random postion of the life time 
float randomLifetime(int ub, int lb){
      float randomLifetime = (float) Math.random() * ub + lb;
      return randomLifetime;

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
float readInterp(Table tab, float a, float b) {
  int x = int(a);
  int y = int(b);
  // TODO: do bilinear interpolation
  return readRaw(tab, x, y);
}

// Reads a raw value 
float readRaw(Table tab, int x, int y) {
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
  System.out.println(bilinearInterpolation(14.0,20.0, 91.0,15.0,20.0,210.0, 14.0,21.0,162.0,15.0,21.0,95.0,14.5,20.2));
  return tab.getFloat(y,x);
}

float bilinearInterpolation(float x1, float y1, float val1, float x2, float y2, float val2, float x3, float y3, float val3,
float x4, float y4, float val4, float px, float py){
  
  // find first point
  float a = interpolationX(x1,y1, val1, x2,y2, val2, px,y1);
  float b = interpolationX(x3,y3, val3, x4,y4, val4, px,y3);
   
  return interpolationY(px,y1, a, px, y3, b, px, py);
}

// finds the value between two points
float interpolationX(float x1, float y1, float pixel1, float x2, float y2, float pixel2, float px, float py){
  
  return (x2-px)/(x2-x1) * pixel1 + (px - x1)/(x2-x1) * pixel2;
  
}

float interpolationY(float x1, float y1, float pixel1, float x2, float y2, float pixel2, float px, float py){ 
  return (y2 - py)/(y2-y1) * pixel1 + (py - y1)/(y2-y1) * pixel2;
}

void loadData(){
  //Check if the value of lifetime is zero, otherwise display it. 
  //Have an array of particles. Then display it then check the value of the life time. 
  //Diplay it using the shapeThing. 
  //Get a random value of postion and magnitude, then set the value. 
   for (int i = 0; i < numParticle; i++) {
     //Get random x 
     //Get random y 
     //Get random lifeTime
     float randomX =  randomLifetime(700, 0);
     float randomY =  randomLifetime(400, 0);
     float lifeTime =  randomLifetime(200, 0);
     particles[i] = new Particle( randomX, randomY, lifeTime);
   }
  
}