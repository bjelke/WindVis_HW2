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
    //this.x = x + (float) Math.random() * 0.1 + (-0.01);
    //this.y = y + (float) Math.random() * 0.1 + (-0.01);
  }
  
  
  
  void display(){
    stroke(0);
    strokeWeight(2);
    fill(153);
    beginShape(POINTS);
    vertex(x,y);
    lifeTime = lifeTime - 1; 
    endShape();
    updatePosition();
    
    //Draw  beginShape(POINTS) 
    //Set the new value of lifetime 
    //Decrease the value of lifetime. 
    
    
    
    
    
  }
}