import megamu.mesh.*;

int maxPoints = 15;

float[][] points = new float[maxPoints][2];

PVector[] vecPoints = new PVector[maxPoints];

float[] randomCircSize = new float[maxPoints];

Delaunay myDelaunay;

float[][] myEdges;

float lineLength = 0;

//PVector testp1 = new PVector(200,200);
//PVector testp2 = new PVector(250,200);
//connectr Connectr = new connectr(testp1, testp2);

connectr[] cnctArray = new connectr[500];

boolean startAnim = false;

void setup() {
  size(800, 800);



  for (int i=0; i<maxPoints; i ++) {
    float point1 = random(100, 700);
    float point2 = random(100, 700);

    points[i][0] =  point1;
    points[i][1] =  point2;

    vecPoints[i] = new PVector(point1, point2);
    //vecPoints[0].y = 200;//point2;
    randomCircSize[i] = random(5, 20);
  }


  myDelaunay = new Delaunay( points );

  myEdges = myDelaunay.getEdges();
  
  
  for (int i=0; i<myEdges.length; i++)
  {
    //float startX = myEdges[i][0];
    //float startY = myEdges[i][1];
    //float endX = myEdges[i][2];
    //float endY = myEdges[i][3];
    
    PVector startR = new PVector(myEdges[i][0], myEdges[i][1]);
    PVector endR = new PVector(myEdges[i][2], myEdges[i][3]);
    
    cnctArray[i] = new connectr(startR, endR);

  }
  
  
}

void draw() {
  

  background(42,48,63);
  
  
    noStroke();
  fill(228,26,67);
  for (int i=0; i<vecPoints.length; i++) {
    //println(vecPoints[i]);
    ellipse(vecPoints[i].x, vecPoints[i].y, randomCircSize[i], randomCircSize[i]);
  }
  
  if(startAnim){
  
  for(int i = 0; i < myEdges.length; i++){
   cnctArray[i].update(); 
  }

  //lineLength += 0.5;


  stroke(228,26,67);
  strokeWeight(3.0);

  //for (int i=0; i<myEdges.length; i++)
  //{
  //  float startX = myEdges[i][0];
  //  float startY = myEdges[i][1];
  //  float endX = myEdges[i][2];
  //  float endY = myEdges[i][3];



  //  // determine the angle
  //  float dx = endX - startX;
  //  float dy = endY - startY;
  //  float angle = atan2(dy, dx);

  //  // calculate the end point
  //  float newX = startX + cos(angle) * lineLength;
  //  float newY = startY + sin(angle) * lineLength;


  //  line( startX, startY, newX, newY );
  //}


  
  //Connectr.update();
  
  }

}


void keyPressed() {
 
    if (key == 'w' || key == 'W') startAnim = true; 

}
 