class connectr { 
  PVector start, end, newEnd;
  float cLength;
  float dX, dY;
  float angle;
  
  float speed = random(1, 5.0);
  float percentSpeed = 0.0;
  float penneredSpeed = 0;
  
  connectr (PVector startr, PVector endr) {  
    start = startr; 
    end = endr;
    newEnd = start;
    
    cLength = 0;
    dX = end.x - start.x;
    dY = end.y - start.y;
    angle = atan2(dY, dX);
  }
  
  void update() {
    // calculate the distance between start and end;
    float initD = end.dist(start);    
    
    float d = end.dist(newEnd);
    //println(d);   
    
    if(d > speed) {
    cLength += speed;
    newEnd = new PVector(start.x + cos(angle) * cLength, start.y + sin(angle) * cLength);
    }        

    if(percentSpeed < 0.99999 )
    {
       percentSpeed +=0.01;
       penneredSpeed = easeOutExpo(percentSpeed);
       //println(value);
    }

    newEnd = new PVector(start.x + cos(angle) * initD*penneredSpeed, start.y + sin(angle) * initD*penneredSpeed);
    //float newX = start.x + cos(angle) * cLength;
    //float newY = start.y + sin(angle) * cLength;
    
    stroke(228,26,67,150);
    line(start.x, start.y, newEnd.x, newEnd.y); 
  }
  

  
}