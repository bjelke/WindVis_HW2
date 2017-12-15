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
  
  void updatePositionEuler(float u,float v){
    //Update the position here using the Euler Method.
    this.x = x + step*u;
    this.y = y + step*v;
  }
  
  void updatePositionRK(float dx, float dy, Table u, Table v){
   //Runge - Kutta 4
   //for x, readInterp(Table tab, float a, float b)
   float kx1 = step*dx;
   float ky1 = step*dy;
   //float kx1 = dx;
   //float ky1 = dy;
   
   float kx2 = step*(WindVis.readInterp(u,x+0.5*kx1, y+0.5*ky1));
   float ky2 = step*(-WindVis.readInterp(v,x+0.5*kx1, y+0.5*ky1));
   
   float kx3 = step*(WindVis.readInterp(u,x+0.5*kx2, y+0.5*ky2));
   float ky3 = step*(-WindVis.readInterp(v,x+0.5*kx2, y+0.5*ky2));
   
   float kx4 = step*(WindVis.readInterp(u,x+kx3, y+ky3));
   float ky4 = step*(-WindVis.readInterp(v,x+kx3, y+ky3));
   
   this.x = x + (1.0/6)*kx1 + (1.0/3)*kx2 + (1.0/3)*kx3 + (1.0/6)*kx4; 
   this.y = y + (1.0/6)*ky1 + (1.0/3)*ky2 + (1.0/3)*ky3 + (1.0/6)*ky4;
   
  
}
  
  void newRandomPosition(){
    this.x = (float) Math.random()* 700;
    this.y = (float) Math.random()* 400;
  }
  
  
  
  void decrementLife(){
    lifeTime = lifeTime - 1; 
  }
}