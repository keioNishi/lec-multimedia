ParticleSystem ps;
void setup() {
  size(640, 360);
  PImage img = loadImage("texture.png");
  ps = new ParticleSystem(0, new PVector(width/2, height-60), img);
}
void draw() {
  background(0);

  // Calculate a "wind" force based on mouse horizontal position
  float dx = map(mouseX, 0, width, -0.2, 0.2);
  PVector wind = new PVector(dx, 0);
  ps.applyForce(wind);
  ps.run();
  for (int i = 0; i < 20; i++) {
    ps.addParticle();
  }
  drawVector(wind, new PVector(width/2, 50, 0), 500);
}

void drawVector(PVector v, PVector loc, float scayl) {
  pushMatrix();
  float arrowsize = 4;
  translate(loc.x, loc.y);
  stroke(255);
  rotate(v.heading());
  float len = v.mag()*scayl;
  line(0, 0, len, 0);
  line(len, 0, len-arrowsize, +arrowsize/2);
  line(len, 0, len-arrowsize, -arrowsize/2);
  popMatrix();
}
