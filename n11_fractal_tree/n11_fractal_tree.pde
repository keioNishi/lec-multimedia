float len=90;
float theta=PI/6;
float r;
void setup() {
  size (700,700);
  background(255);
  translate(width/2,height*0.9);
  scale(2);
//}

//void draw() {
 // stroke(0);
branch(len, theta,r);
}

// Each branch now receives
// its length as an argument.
void branch(float len, float theta, float r) {
  strokeWeight(0.03*pow(len, 1.2));
  line(0, 0, 0, -len);
  translate(0, -len);

  len = .7*(len+6*r);
  r=random(-0.2,0.3);
  theta=theta*0.9;
  
  if (len > 3.5) {
    pushMatrix();
    rotate(theta-r);
    // Subsequent calls to branch()
    // include the length argument.
    branch(len, theta, r);
    //theta=0.9*theta;
    popMatrix();
    //theta=theta-0.01;
    pushMatrix();
    rotate(-theta);
    branch(len, theta, r);
    //theta=0.9*theta;
    popMatrix();
  }
}
