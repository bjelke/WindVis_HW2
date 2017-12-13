class Particle{
  
  float x;
  float y;
  float lifeTime;
     

  Particle(float x, float y, float lifeTime){
    this.x = x;
    this.y = y;
    this.lifeTime = lifeTime;
  }
  
  void updatePosition(){
    //Update the position here using the Euler Method. 
    this.x = x + (float) Math.random() * 0.1 + (-0.01);
    this.y = y + (float) Math.random() * 0.1 + (-0.01);
  }
  
  void newRandomPosition(){
    this.x = (float) Math.random()* 700;
    this.y = (float) Math.random()*400;
  }
  
  
  
  void display(){

    lifeTime = lifeTime - 1; 
    updatePosition();
    
    //Draw  beginShape(POINTS) 
    //Set the new value of lifetime 
    //Decrease the value of lifetime.   
    
    
  }
}