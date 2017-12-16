// Authors: Brighten Jelke and Khin Kyaw
// Class representing a single particle in the wind visualization.

class Particle{
  float step = 0.1;
  float x;
  float y;
  int lifeTime;
     

  Particle(float x, float y, int lifeTime){
    this.x = x;
    this.y = y;
    this.lifeTime = lifeTime;
  }
  
   //Update the position here using the Euler Method.
  void updatePositionEuler(float u,float v){
    this.x = x + step*u;
    this.y = y + step*v;
  }
  
  // update the position here using Runge-Kutta 4
  void updatePositionRK(float dx, float dy, Table u, Table v, float a, float b){
   float kx1 = dx;
   float ky1 = dy;
   
   float kx2 = (WindVis.readInterp(u,a+0.5*kx1*step, b+0.5*ky1*step));
   float ky2 = WindVis.readInterp(v,a+0.5*kx1*step, b+0.5*ky1*step);
   
   float kx3 = (WindVis.readInterp(u,a+0.5*kx2*step, b+0.5*ky2*step));
   float ky3 = (WindVis.readInterp(v,a+0.5*kx2*step, b+0.5*ky2*step));
   
   float kx4 = (WindVis.readInterp(u,a+kx3*step, a+ky3*step));
   float ky4 = (WindVis.readInterp(v,a+kx3*step, b+ky3*step));
   
   this.x = x + step*((1.0/6)*kx1 + (1.0/3)*kx2 + (1.0/3)*kx3 + (1.0/6)*kx4); 
   this.y = y - step*((1.0/6)*ky1 + (1.0/3)*ky2 + (1.0/3)*ky3 + (1.0/6)*ky4);
  }
  
  // set new random position
  void newRandomPosition(){
    this.x = (float) Math.random()* width;
    this.y = (float) Math.random()* height;
  }
  
  // decrease remaining life of particle
  void decrementLife(){
    lifeTime = lifeTime - 1; 
  }
}