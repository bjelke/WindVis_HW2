class Particle{
  float step = 0.1;
  
  float x;
  float y;
  float lifeTime;
     

  Particle(float x, float y, float lifeTime){
    this.x = x;
    this.y = y;
    this.lifeTime = lifeTime;
  }
  
  void updatePositionEuler(float u,float v){
    //Update the position here using the Euler Method.
    this.x = x + step*u;
    this.y = y + step*v;
  }
  
  void newRandomPosition(){
    this.x = (float) Math.random()* 700;
    this.y = (float) Math.random()* 400;
  }
  
  
  
  void decrementLife(){

    lifeTime = lifeTime - 1; 
    
  }
}